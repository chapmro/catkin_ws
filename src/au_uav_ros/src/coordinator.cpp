#include "au_uav_ros/coordinator.h"
using namespace au_uav_ros;
using std::cout;
using std::endl;

double lastMsg = -1.0; // The time the last message was sent

#define COORD_PRINT_DEBUG true
#define COORD_PRINT_DEBUG_ASTAR_0 true
#define COORD_PRINT_DEBUG_ASTAR_1 true
#define COORD_PRINT_DEBUG_ASTAR_2 true
#define COORD_PRINT_DEBUG_TIME false
#define CHECK_FOR_MSG 1.0

std::string CAAlgorithm;

void Coordinator::run(void) {
    ros::spin();
}

void Coordinator::init(ros::NodeHandle _n) {
    n = _n;
    setup();
}

void Coordinator::setup(void) {
    if (n.getParam("runPathPlanner", planPath)) {
        //planPath = $(arg planPath)
        // md
        if (planPath) {
            // planPathTimer = n.createTimer(ros::Duration(5.0), &Coordinator::plan, this);
        }
    } else {
        planPath = false;
    }

    if (n.getParam("runCentralized", centralized)) {
        //centralized = $(arg centralized)
    } else {
        centralized = true;
    }

    if (!n.getParam("CAAlgorithm", CAAlgorithm)) {
        CAAlgorithm = "NONE";
    }

    if (COORD_PRINT_DEBUG) {
        if (centralized) {
            ROS_INFO("Running centralized collision avoidance!");
        }
        else {
            ROS_INFO("Running decentralized collision avoidance!");
        }
    }

    shutdownTopic = n.subscribe("component_shutdown", 1000, &Coordinator::component_shutdown, this);
    addPlaneService = n.advertiseService("add_plane", &Coordinator::add_plane, this);
    setWpService = n.advertiseService("set_wp", &Coordinator::set_wp, this);
    loadCourseService =n.advertiseService("load_course", &Coordinator::load_course, this);
    removeWpService = n.advertiseService("remove_wp", &Coordinator::remove_wp, this);
    removePlaneService = n.advertiseService("remove_plane", &Coordinator::remove_plane, this);

    centralizeService = n.advertiseService("centralize", &Coordinator::centralize, this);

    manageSimPlanesClient = n.serviceClient<au_uav_ros::SimPlane>("manage_simplanes");

    telemetryTopic = n.subscribe("telemetry", 1000, &Coordinator::telemetry, this);
    commandTopic = n.advertise<au_uav_ros::Command>("commands", 1000);

    //JJF generateMessageTimer = n.createTimer(ros::Duration(CHECK_FOR_MSG), &Coordinator::simulateMsg, this);
}

void Coordinator::component_shutdown(const std_msgs::String::ConstPtr &msg) {
    // md
    ROS_ERROR("Coordinator: %s", msg->data.c_str());
    ros::shutdown();
}

bool Coordinator::add_plane(AddPlane::Request &req, AddPlane::Response &res) {
    //one waypoint is required for a plane to be added
    struct waypoint wp;
    wp.altitude = req.altitude;
    wp.latitude = req.latitude;
    wp.longitude = req.longitude;
    PlaneBuilder b;
    if (req.sim) {
        SimPlane s;
        int id = b.buildSimPlane(wp, *this, s);
        if (id != -1) {
            manageSimPlanesClient.call(s);
            Command cmd = simPlanes[id].getPriorityCommand();
            cmd.sim = true;
            commandTopic.publish(cmd);
            return true;
        } else {
            res.error = "Failed to add new plane";
            return false;
        }
    } else {
        int id = b.buildPlane(wp, *this);
        if (id != -1) {
            Command cmd = simPlanes[id].getPriorityCommand();
            cmd.sim = false;
            commandTopic.publish(cmd);
        } else {
            res.error = "Failed to add new plane";
            return false;
        }
    }
}

bool Coordinator::set_wp(SetWp::Request &req, SetWp::Response &res) {
    if (planes.find(req.planeID) != planes.end() || simPlanes.find(req.planeID) != simPlanes.end()) {
        res.error = "None";
        struct waypoint wp;
        wp.altitude = req.altitude;
        wp.latitude = req.latitude;
        wp.longitude = req.longitude;
        if (req.sim) {
            simPlanes[req.planeID].addNormalWp(wp);
            SimPlane s;
            s.request.clear = false;
            s.request.add = true;
            s.request.size = 1;
            s.request.planeID = req.planeID;
            s.request.latitudes.push_back(req.latitude);
            s.request.longitudes.push_back(req.longitude);
            s.request.altitudes.push_back(req.altitude);
            manageSimPlanesClient.call(s);
        } else {
            planes[req.planeID].addNormalWp(wp);
        }
    } else {
        res.error = "Plane ID not found";
    }
    return true;
}

bool Coordinator::load_course(LoadCourse::Request &req, LoadCourse::Response &res) {
    if (req.wipe == true) {
        planes.clear();
        for (std::map<int, SimPlaneObject>::iterator i = simPlanes.begin(); i != simPlanes.end(); i++) {
            SimPlane msg;
            msg.request.clear = true;
            if (!manageSimPlanesClient.call(msg)) {
                res.error = "Failed to connect to simulator";
                return false;
            }
        }
        simPlanes.clear();
    }
    PlaneBuilder b;
    std::string file = req.filename.c_str();
    std::map<int , SimPlane> s;
    if (b.buildCourse(file, *this, s)) {
	int newStreamRate = 4; // This is the default stream rate
	if(!planes.empty()) newStreamRate = newStreamRate/(planes.size()); // The default streamrate is divided by the number of planes       

	//publish new commands
        for (std::map<int, PlaneObject>::iterator i = planes.begin(); i != planes.end(); i++) {
	    //first set each real UAV's ID
	    Command cmd;
	    cmd.commandID = COMMAND_SET_ID;
            cmd.planeID = i->second.getID();
            cmd.param = i->second.getID();
            cmd.sim = false;
            cmd.commandHeader.stamp = ros::Time::now();
            commandTopic.publish(cmd);
	    //next set each real UAV's Stream Rate
	    Command cmd1;
            cmd1.commandID = COMMAND_SET_STREAMRATE;
	    cmd1.planeID = i->second.getID();
	    cmd1.param = newStreamRate;
	    cmd1.sim = false;
	    cmd1.commandHeader.stamp = ros::Time::now();
	    commandTopic.publish(cmd1);
	    //now send the first waypoint, or avoidance point if needed.
            Command cmd2 = i->second.getPriorityCommand();
            cmd2.sim = false;
            commandTopic.publish(cmd2);
        }
        for (std::map<int, SimPlane>::iterator i = s.begin(); i != s.end(); i++) {
            manageSimPlanesClient.call(i->second);
        }
        for (std::map<int, SimPlaneObject>::iterator i = simPlanes.begin(); i != simPlanes.end(); i++) {
            Command cmd = i->second.getPriorityCommand();
            cmd.sim = true;
            commandTopic.publish(cmd);
        }
        return true;
    } else {
        res.error = "Failed to load course from coordinator";
        return false;
    }
}

bool Coordinator::remove_wp(RemoveWp::Request &req, RemoveWp::Response &res) {
    if (planes.find(req.planeID) != planes.end() || simPlanes.find(req.planeID) != simPlanes.end()) {
        res.error = "None";
        struct waypoint wp;
        wp.altitude = req.altitude;
        wp.latitude = req.latitude;
        wp.longitude = req.longitude;
        if (req.sim) {
            SimPlane s;
            s.request.clear = false;
            s.request.planeID = req.planeID;
            s.request.add = false;
            s.request.latitudes.push_back(req.latitude);
            s.request.longitudes.push_back(req.longitude);
            s.request.altitudes.push_back(req.altitude);
            s.request.size = 1;
            manageSimPlanesClient.call(s);
            simPlanes[req.planeID].removeNormalWp(wp);
        } else {
            planes[req.planeID].removeNormalWp(wp);
        }
    } else {
        res.error = "Plane ID not found";
    }
    return true;
}

bool Coordinator::remove_plane(RemovePlane::Request &req, RemovePlane::Response &res) {
    if (planes.find(req.planeID) != planes.end() || simPlanes.find(req.planeID) != simPlanes.end()) {
        res.error = "None";
        if (req.sim) {

            SimPlane s;
            s.request.clear = false;
            s.request.planeID = req.planeID;
            s.request.size = 0;
            manageSimPlanesClient.call(s);
			simPlanes.erase(req.planeID);
        } else {
            planes.erase(req.planeID);
        }
    } else {
        res.error = "Plane ID not found";
    }
    return true;
}

bool Coordinator::centralize(Centralize::Request &req, Centralize::Response &res) {
    if (req.centralize) {
        centralized = true;
    } else {
        centralized = false;
    }
    res.error = "None";
}


// This method should be called every second or so to determine
// whether or not a fake uav message needs to be generated.
/*void Coordinator::simulateMsg(const ros::TimerEvent &e)
{
	// loop through all the planes to check for each one
	int planeID = 1;	
	if(ros::Time::now().toSec() - lastMsg > 1)
	{
		au_uav_ros::Telemetry msg;
		fillTelemetryUpdate(&msg, planes[planeID]);
		// generate message
		telemetry(msg);
		
		lastMsg = ros::Time::now().toSec();
	}
}

bool Coordinator::fillTelemetryUpdate(au_uav_ros::Telemetry *update, planeObject plane) {
	int simSpeed = 1;

	//difference in latitudes in radians
	double lat1 = plane->currentLoc.latitude*DEGREES_TO_RADIANS;
	double long1 = plane->currentLoc.longitude*DEGREES_TO_RADIANS;
	double lat2, long2;

	if (plane->currentDest != INVALID_WP) {
		lat2 = plane->currentDest.latitude*DEGREES_TO_RADIANS;
		long2 = plane->currentDest.longitude*DEGREES_TO_RADIANS;
	}else {
		lat2 = plane->normalPath.front().latitude*DEGREES_TO_RADIANS;
		long2 = plane->normalPath.front().longitude*DEGREES_TO_RADIANS;
	}
	
	double deltaLat = lat2 - lat1;
	double deltaLong = long2 - long1;

	//calculate bearing from current position to destination
	double y = sin(deltaLong)*cos(lat2);
	double x = cos(lat1)*sin(lat2) - sin(lat1)*cos(lat2)*cos(deltaLong);
	plane->targetBearing = atan2(y, x)*RADIANS_TO_DEGREES;
	

	//calculate the real bearing based on our maximum angle change
	//first create a temporary bearing that is the same as bearing but at a different numerical value
	double tempBearing = -1000;
	if((plane->targetBearing) < 0)
	{
		tempBearing = plane->targetBearing + 360;
	}
	else
	{
		tempBearing = plane->targetBearing - 360;
	}

	double diff1 = abs(plane->currentBearing - plane->targetBearing);
	double diff2 = abs(plane->currentBearing - tempBearing);

	//check for easy to calculate values first
	if(diff1 < (22.5*simSpeed) || diff2 < (22.5*simSpeed))
	{
		//the difference is less than our maximum angle, set it to the bearing
		plane->currentBearing = plane->targetBearing;
	}
	else
	{
		//we have a larger difference than we can turn, so turn our maximum
		double mod;
		if(diff1 < diff2)
		{
			if(plane->targetBearing > plane->currentBearing) mod = (22.5*simSpeed);
			else mod = 0 - (22.5*simSpeed);
		}
		else
		{
			if(tempBearing > plane->currentBearing) mod = (22.5*simSpeed);
			else mod = 0 - (22.5*simSpeed);
		}

		//add our mod, either +22.5 or -22.5
		plane->currentBearing = plane->currentBearing + mod;

		//tweak the value to keep it between -180 and 180
		if(plane->currentBearing > 180) plane->currentBearing = plane->currentBearing - 360;
		if(plane->currentBearing <= -180) plane->currentBearing = plane->currentBearing + 360;
	}

	//time to calculate the new positions, God help us
	/*
	Algorithm for updating position:
	1) Estimate new latitude using basic trig and this equation:
	   lat2 = lat1 + (MPS_SPEED*cos(bearing))*METERS_TO_LATITUDE
	2) Use law of haversines to find the new longitude
	   haversin(c) = haversin(a-b) + sin(a)*sin(b)*haversin(C)
	   where haversin(x) = (sin(x/2.0))^2
	   where c = MPS_SPEED/EARTH_RADIUS (radians)
	   where a = 90 - lat1 (degrees)
	   where b = 90 - lat2 (degrees)
	   where C = the change in longitude, what we are solving for
	   
	   C = 2.0 * arcsin(sqrt((haversin(c) - haversin(a-b))/(sin(a)*sin(b))))
	*//*

	//1) Estimate new latitude using basic trig and this equation
	plane->currentLoc.latitude = lat1*RADIANS_TO_DEGREES + ((MPS_SPEED*simSpeed)*cos(plane->currentBearing*DEGREES_TO_RADIANS))*METERS_TO_LATITUDE;

	//2) Use the law of haversines to find the new longitude
	double temp = pow(sin(((MPS_SPEED*simSpeed)/EARTH_RADIUS)/2.0), 2); //TODO verify
	temp = temp - pow(sin((plane->currentLoc.latitude*DEGREES_TO_RADIANS - lat1)/2.0), 2);
	temp = temp / (sin(M_PI/2.0 - lat1)*sin((M_PI/2.0)-plane->currentLoc.latitude*DEGREES_TO_RADIANS));
	temp = 2.0 * RADIANS_TO_DEGREES * asin(sqrt(temp));
	
	//depending on bearing, we should be either gaining or losing longitude
	if(currentBearing > 0)
	{
		plane->currentLoc.longitude += temp;
	}
	else
	{
		plane->currentLoc.longitude -= temp;
	}

	plane->distanceToDestination = distanceBetween(plane->currentLoc, plane->currentDest);
	update->planeID = plane->id;
	update->currentLatitude = plane->currentLoc.latitude;
	update->currentLongitude = plane->currentLoc.longitude;
	update->currentAltitude = plane->currentLoc.altitude;

	update->destLatitude = plane->currentDest.latitude;
	update->destLongitude = plane->currentDest.longitude;
	update->destAltitude = plane->currentDest.altitude;
	update->currentWaypointIndex = plane->currentWaypointIndex;
	plane->speed = MPS_SPEED*simSpeed; 
	update->groundSpeed = plane->speed;
	//TODO: charge name to currentBearing	
	update->targetBearing = plane->currentBearing;
	update->distanceToDestination = plane->distanceToDestination;
	update->telemetryHeader.stamp = ros::Time::now();
	updateTime();
	
	return true;
}*/

void Coordinator::telemetry(const au_uav_ros::Telemetry &msg) {
    std::vector<waypoint> avoidanceWps;
    Command cmd;
    if (planes.find(msg.planeID) != planes.end()) { /*TODO Handle ID duplicates-- map doesnt allow key duplicates */
	lastMsg = ros::Time::now().toSec();        
	if (planes[msg.planeID].update(msg, cmd)) {
            cmd.sim = false;
		//ROS_ERROR("got new WP command");
            commandTopic.publish(cmd); //JJf investigate
        }
        //call collision here           /* if all planes are set a def val we can use that val to check */
        if (centralized) {
	    if (CAAlgorithm == "RIPNA")
            	ca.ripnaAvoid(msg.planeID, planes, simPlanes, avoidanceWps);
	    else if (CAAlgorithm == "APF")
            	ca.apfAvoid(msg.planeID, planes, simPlanes, avoidanceWps);
            for (unsigned int i = 0; i < avoidanceWps.size(); i++) {
		//DR. BIAZ FIX: Check if the avoidance waypoint to be sent is within a threshold of our current destination. If so, simply don't send the avoidance WP.
		if (distanceBetween(avoidanceWps[i], planes[msg.planeID].getDestination()) > WAYPOINT_THRESHOLD) {
               		Command cmd;
                	cmd.planeID = avoidanceWps[i].planeID;
                	if (simPlanes.find(cmd.planeID) != simPlanes.end()) {
                	    cmd.sim = true;
                	} else {
                	    cmd.sim = false;
                	}
                	cmd.commandID = COMMAND_AVOID_WP;
                	cmd.latitude = avoidanceWps[i].latitude;
                	cmd.longitude = avoidanceWps[i].longitude;
                	cmd.altitude = avoidanceWps[i].altitude;
                	commandTopic.publish(cmd);
			ROS_ERROR("Publishing avoidance waypoint for UAV%d", avoidanceWps[i].planeID);
		}
		else {
			ROS_ERROR("Didnt send avoidance WP for UAV%d", avoidanceWps[i].planeID);
		}
            }
        } else {
            // Real plane decentralized CA
            // is in the air on the Pi
        }
    } else if (simPlanes.find(msg.planeID) != simPlanes.end()) {
        if (simPlanes[msg.planeID].update(msg, cmd)) {
            // Update: sim planes do not know their A* planned path. Those are set individually by
            // Coordinator. A* waypoints are set one at a time as avoidance wps.
            cmd.sim = true;
            commandTopic.publish(cmd);
        }
        //call collision here
        if (centralized) {
	    if (CAAlgorithm == "RIPNA")
            	ca.ripnaAvoid(msg.planeID, planes, simPlanes, avoidanceWps);
	    else if (CAAlgorithm == "APF")
            	ca.apfAvoid(msg.planeID, planes, simPlanes, avoidanceWps);
            for (unsigned int i = 0; i < avoidanceWps.size(); i++) {
                Command cmd;
                cmd.planeID = avoidanceWps[i].planeID;
                if (simPlanes.find(cmd.planeID) != simPlanes.end()) {
                    cmd.sim = true;
                } else {
                    cmd.sim = false;
                }
                cmd.commandID = COMMAND_AVOID_WP;
                cmd.latitude = avoidanceWps[i].latitude;
                cmd.longitude = avoidanceWps[i].longitude;
                cmd.altitude = avoidanceWps[i].altitude;
                commandTopic.publish(cmd);
            }
        } else {
            // md
            // Decentralized collision avoidance here
/*
            waypoint avoidanceWP;
            ca.distrubuted_avoid(msg.planeID, planes, simPlanes, avoidanceWP);

      	    if (avoidanceWP.planeID == msg.planeID) {
                if (simPlanes.find(msg.planeID) != simPlanes.end()) {
                    //simPlanes[msg.planeID].addAvoidanceWp(avoidanceWP);
                    Command newCmd;
                    newCmd.planeID = msg.planeID;
                    newCmd.sim = true;
                    newCmd.commandID = COMMAND_AVOID_WP;
                    newCmd.latitude = avoidanceWP.latitude;
                    newCmd.longitude = avoidanceWP.longitude;
                    newCmd.altitude = avoidanceWP.altitude;

                    commandTopic.publish(newCmd);
                }
                else {
                    ROS_ERROR("Got an avoidance WP, but #%d wasn't in the map!", msg.planeID);
                }
            }
*/
        }
    } else {
	//a random aircraft flew into the flight space, or we haven't loaded the course yet for an active real UAV.
        //resolvePlaneID(msg);	//TODO: rework resolvePlaneID to add the UAV to the planes array with an unused planeID, and make it fly to a known location.
    }
}

/*
void Coordinator::plan(const ros::TimerEvent& e) {
    std::map<int, std::vector<waypoint> > allPlanesPath;

    ros::Time start = ros::Time::now();
    ca.astar_planPath(planes, simPlanes, allPlanesPath);
    ros::Time end = ros::Time::now();

    if (COORD_PRINT_DEBUG_TIME) {
        ROS_INFO("Planner ran in %f secs", (end-start).toSec());
    }

    std::map<int, std::vector<waypoint> >::iterator it;
    for (it = allPlanesPath.begin(); it != allPlanesPath.end(); it++) {
        if (planes.find(it->first) != planes.end()) {
            // TODO: real planes
        } else if (simPlanes.find(it->first) != simPlanes.end()) {
            if (COORD_PRINT_DEBUG_ASTAR_1) {
                // ROS_INFO("Planned path for #%d has %li waypoints.", it->first, allPlanesPath[it->first].size());
                if (planeAvoiding.test(it->first)) {
                    ROS_WARN("Plane #%d is avoiding a threat.", it->first);
                }
            }

            // if (!planeAvoiding.test(it->first)) {
            // if (true) {              int pointsToSkip = (int) simPlanes[it->first].getSimSpeed();
                int pointsToSkip = 0;

                std::vector<waypoint>::iterator itt = allPlanesPath[it->first].begin();
                for (int i = 0; i < pointsToSkip; i++) {
                    if (itt == allPlanesPath[it->first].end()) {
                        break;
                    } else {
                        itt++;
                    }
                }
                while (itt != allPlanesPath[it->first].end()
                    && distanceBetween(simPlanes[it->first].getCurrentLoc(), *itt) < WAYPOINT_THRESHOLD) {
                    itt++;
                }

                std::vector<waypoint> planePath(itt, allPlanesPath[it->first].end());

                simPlanes[it->first].setPlannedPath(planePath);
            // }
        }
    }
}
*/
void Coordinator::resolvePlaneID(const Telemetry &msg) {

    Command cmd; //TODO assumptions -- only real planes can have id conflict --
    if (!newPlanes.empty()) {//a plane has already been created for a real plane to fill
        cmd.commandID = COMMAND_SET_ID;
        cmd.planeID = msg.planeID;
        cmd.param = newPlanes.front();
        cmd.sim = false;
        cmd.commandHeader.stamp = ros::Time::now();
        commandTopic.publish(cmd);
        newPlanes.pop_front();

        //Send new plane its first wp
        Command firstWp;
        firstWp.commandID = COMMAND_NORMAL_WP;
        firstWp.planeID = cmd.param;
        firstWp.sim = false;
        firstWp.latitude = planes[cmd.param].getDestination().latitude;
        firstWp.longitude = planes[cmd.param].getDestination().longitude;
        firstWp.altitude = planes[cmd.param].getDestination().altitude;
        firstWp.commandHeader.stamp = ros::Time::now();
        commandTopic.publish(firstWp);
    } else {
        waypoint dest;
        dest.altitude = msg.destAltitude;
        dest.longitude = msg.destLongitude;
        dest.latitude = msg.destLatitude;
        PlaneBuilder b;
        cmd.commandID = COMMAND_SET_ID;
        cmd.planeID = msg.planeID;
        cmd.param = b.buildPlane(dest, *this);
        if (cmd.param != -1) {
            cmd.sim = false;
            cmd.commandHeader.stamp = ros::Time::now();
            commandTopic.publish(cmd);
        }
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "Coordinator");
    ros::NodeHandle n;
    Coordinator c;
    c.init(n);
    c.run();
    return 0;
}
