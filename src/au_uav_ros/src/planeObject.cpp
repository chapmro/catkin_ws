#include "au_uav_ros/planeObject.h"
using namespace au_uav_ros;

/* Implementation of the default constructor: Member variables are set to zero */
PlaneObject::PlaneObject(void) {
    this->id = 0;
    this->currentLoc.altitude = 0.0;
    this->currentLoc.latitude = 0.0;
    this->currentLoc.longitude = 0.0;
    this->previousLoc.altitude = 0.0;
    this->previousLoc.latitude = 0.0;
    this->previousLoc.longitude = 0.0;
    this->targetBearing = 0.0;
    this->currentBearing = 0.0;
    this->distanceToDestination = 0.0;
    this->speed = 0.0;
    this->lastUpdateTime = ros::Time::now().toSec();
    this->currentWaypointIndex = 0;
    this->currentDest = INVALID_WP;
    this->MAX_NUMBER_OF_WAYPOINTS = 0;

}

PlaneObject::PlaneObject(struct waypoint wp) {
    this->id = wp.planeID;
    this->currentLoc.altitude = 0.0;
    this->currentLoc.latitude = 0.0;
    this->currentLoc.longitude = 0.0;
    this->previousLoc.altitude = 0.0;
    this->previousLoc.latitude = 0.0;
    this->previousLoc.longitude = 0.0;
    this->targetBearing = 0.0;
    this->currentBearing = 0.0;
    this->distanceToDestination = 0.0;
    this->speed = 0.0;
    this->lastUpdateTime = ros::Time::now().toSec();
    this->normalPath.push_back(wp);
    this->currentWaypointIndex = 0;
    this->currentDest = normalPath.front();
    this->MAX_NUMBER_OF_WAYPOINTS = 1;
}

PlaneObject::PlaneObject(int _id) {
    this->id = _id;
}

/* Explicit value constructor using Telemetry */
PlaneObject::PlaneObject(const Telemetry &msg) {
    this->id = msg.planeID;
    this->currentLoc.altitude = msg.currentAltitude;
    this->currentLoc.latitude = msg.currentLatitude;
    this->currentLoc.longitude = msg.currentLongitude;
    this->previousLoc.altitude = 0.0;
    this->previousLoc.latitude = 0.0;
    this->previousLoc.longitude = 0.0;
    this->targetBearing = msg.targetBearing;
    this->currentBearing = 0.0;
    this->distanceToDestination = 0.0;
    this->speed = msg.groundSpeed;
    waypoint wp;
    wp.latitude = msg.destLatitude;
    wp.longitude = msg.destLongitude;
    wp.altitude = msg.destAltitude;
    this->normalPath.push_back(wp);
    this->currentDest = normalPath.front();
    this->lastUpdateTime = ros::Time::now().toSec();
    this->currentWaypointIndex = 0;
}

/* mutator functions to update member variables */
void PlaneObject::setID(int id){
    this->id = id;
}

void PlaneObject::setPreviousLoc(double lat, double lon, double alt) {
    this->previousLoc.latitude = lat;
    this->previousLoc.longitude = lon;
    this->previousLoc.altitude = alt;
}

void PlaneObject::setCurrentLoc(double lat, double lon, double alt) {
    this->currentLoc.latitude = lat;
    this->currentLoc.longitude = lon;
    this->currentLoc.altitude = alt;
}

void PlaneObject::setCurrentDest(double lat, double lon, double alt) {
    this->currentDest.latitude = lat;
    this->currentDest.longitude = lon;
    this->currentDest.altitude = alt;
}

void PlaneObject::setTargetBearing(double tBearing) {
    this->targetBearing = tBearing;
}

void PlaneObject::setCurrentBearing(double cBearing) {
    this->currentBearing = cBearing;
}

void PlaneObject::setSpeed(double speed) {
    this->speed = speed;
}

void PlaneObject::updateTime(void) {
    this->lastUpdateTime = ros::Time::now().toSec();
}

//used to keep up with wp index for real UAVs
void PlaneObject::incrementCurrentWaypointIndex(void) {
    this->currentWaypointIndex++;
}

void PlaneObject::populatePlaneInfo(const Telemetry &msg) {
    //Update previous and current position
    this->setPreviousLoc(this->currentLoc.latitude, this->currentLoc.longitude, this->currentLoc.altitude);
    this->setCurrentLoc(msg.currentLatitude, msg.currentLongitude, msg.currentAltitude);
    this->setCurrentDest(msg.destLatitude, msg.destLongitude, msg.destAltitude);
 
    // Changed from cardinal to cartesian.
    // TODO: Get rid of those DELTA_LXX_TO_METERS constants
    double numerator = (this->currentLoc.latitude - this->previousLoc.latitude);
    double denominator = (this->currentLoc.longitude - this->previousLoc.longitude);
    double angle = atan2(numerator*DELTA_LAT_TO_METERS,denominator*DELTA_LON_TO_METERS)*180/PI;

    if (numerator != 0 || denominator != 0) {
        this->setCurrentBearing(angle);
    } else {
        this->setCurrentBearing(0);
    }

    // Update everything else
    this->setTargetBearing(msg.targetBearing);
    this->setSpeed(msg.groundSpeed);
    this->updateTime();
    this->currentWaypointIndex = normalPath.size() % MAX_NUMBER_OF_WAYPOINTS;

}

bool PlaneObject::isWaypointHit(const Telemetry &msg, Command &newCommand) {
    //this bool is set true only if there is something available to be sent to the UAV
    bool isCommand = false;


    //execute logic to see if we have hit a waypoint
    //check to see if distanceToDest is < than WPThreshold
    if(this->currentDest != INVALID_WP && msg.distanceToDestination > -WAYPOINT_THRESHOLD && msg.distanceToDestination < WAYPOINT_THRESHOLD)
    {	
	//ROS_ERROR("Plane %d hit a waypoint", this->id);       
	//we've hit a waypoint, is it a normalWP or an avoidanceWP?
       if (distanceBetween(this->currentDest, normalPath.front()) > -WAYPOINT_THRESHOLD &&
	 distanceBetween(this->currentDest, normalPath.front()) < WAYPOINT_THRESHOLD) {
		//we've hit a normal waypoint, but only pop it if we have more wp's to send
		//i.e. don't pop the last wp
		//if (this->id == 24 && normalPath.size() < 8) {
		//	ROS_ERROR("%d", normalPath.size());
		//}
		if (normalPath.size() > 1) {
			normalPath.pop_front();
			isCommand = true;
		}		
	}
	else {
		//we've hit an avoidanceWP, so continue the mission
		isCommand = true;
        }
    }

    //DIRTY AVOIDANCE FIX: simply pop the avoidance waypoint immediately once we receive the telemetry message following when the avoidance WP was sent.
    // else {
    // if (distanceBetween(this->currentDest, normalPath.front()) < -WAYPOINT_THRESHOLD &&
    //	 distanceBetween(this->currentDest, normalPath.front()) > WAYPOINT_THRESHOLD) {
		//we're going to an avoidance WP
	//isCommand = true;		
    //}

    //if we have a command to process, process it
    if(isCommand)
    {
       if (!normalPath.empty()) {
            newCommand.commandID = COMMAND_NORMAL_WP;
            newCommand.commandHeader.stamp = ros::Time::now();
            newCommand.planeID = id;
            newCommand.latitude = normalPath.front().latitude;
            newCommand.longitude = normalPath.front().longitude;
            newCommand.altitude = normalPath.front().altitude;
            return true;
        }
    }
    else {
        //if we get here, then nothing to avoid and no new wps need to be sent for normal path
        return false;
    }
}


bool PlaneObject::update(const Telemetry &msg, Command &cmd) {

    //keep this planeObject up-to-date so store telemetry info
    populatePlaneInfo(msg);    
    return isWaypointHit(msg, cmd);
}

/* accessor functions */
int PlaneObject::getID(void) const {
    return this->id;
}

int PlaneObject::getCurrentWaypointIndex(void) {
    return this->currentWaypointIndex;
}

waypoint PlaneObject::getPreviousLoc(void) const {
    return this->previousLoc;
}

waypoint PlaneObject::getCurrentLoc(void) const {
    return this->currentLoc;
}

double PlaneObject::getTargetBearing(void) const {
    return this->targetBearing;
}

double PlaneObject::getCurrentBearing(void) const {
    return this->currentBearing;
}

double PlaneObject::getSpeed(void) const {
    return this->speed;
}

double PlaneObject::getLastUpdateTime(void) const {
    return this->lastUpdateTime;
}

waypoint PlaneObject::getDestination(void) const {
    //if (!plannedPath.empty()) {
    //    return plannedPath.front();
    //} else 
    if (currentDest != INVALID_WP) {
	return currentDest;
    } else {
        return normalPath.front();
    }
}

double PlaneObject::getSimSpeed(void) const {
    return 0;
}

/* Find distance between this plane and another plane, returns in meters */
double PlaneObject::findDistance(const PlaneObject& plane) const {
    return this->findDistance(plane.currentLoc.latitude, plane.currentLoc.longitude);
}


/* Find distance between this plane and another pair of coordinates,
returns value in meters */
double PlaneObject::findDistance(double lat2, double lon2) const {
    double xdiff = (lon2 - this->currentLoc.longitude)*DELTA_LON_TO_METERS;
    double ydiff = (lat2 - this->currentLoc.latitude)*DELTA_LAT_TO_METERS;

    return sqrt(pow(xdiff, 2) + pow(ydiff, 2));
}

/* Find Cartesian angle between this plane and another plane, using this plane
as the origin */
double PlaneObject::findAngle(const PlaneObject& plane) const {
    return this->findAngle(plane.currentLoc.latitude, plane.currentLoc.longitude);
}

/* Find Cartesian angle between this plane and another plane's latitude/longitude
using this plane as the origin */
double PlaneObject::findAngle(double lat2, double lon2) const {
    double xdiff = (lon2 - this->currentLoc.longitude)*DELTA_LON_TO_METERS;
    double ydiff = (lat2 - this->currentLoc.latitude)*DELTA_LAT_TO_METERS;

    return atan2(ydiff, xdiff);
}


PlaneObject& PlaneObject::operator=(const PlaneObject& plane) {

    this->id = plane.id;
    this->currentLoc.altitude = plane.currentLoc.altitude;
    this->currentLoc.latitude = plane.currentLoc.latitude;
    this->currentLoc.longitude = plane.currentLoc.longitude;

    this->previousLoc.altitude = plane.previousLoc.altitude;
    this->previousLoc.latitude = plane.previousLoc.latitude;
    this->previousLoc.longitude = plane.previousLoc.longitude;

    //this->plannedPath = plane.plannedPath;
    this->normalPath = plane.normalPath;

    this->targetBearing = plane.targetBearing;
    this->currentBearing = plane.currentBearing;

    this->speed = plane.speed;
    this->lastUpdateTime = plane.lastUpdateTime;

    return *this;
}

/*
void PlaneObject::setPlannedPath(std::vector<waypoint> path) {
    plannedPath.clear();
    plannedPath.insert(plannedPath.begin(), path.begin(), path.end());
}
*/
void PlaneObject::addNormalWp(struct au_uav_ros::waypoint wp) {
    normalPath.push_back(wp);
    if (normalPath.size() > this->MAX_NUMBER_OF_WAYPOINTS) 
	MAX_NUMBER_OF_WAYPOINTS = normalPath.size();
}

void PlaneObject::addAvoidanceWp(struct au_uav_ros::waypoint wp) {
    //ROS_ERROR("ID#%d (called after ca.avoid) d2d: %f",wp.planeID, distanceBetween(this->currentLoc, wp));
    //this->currentDest = wp;
}

void PlaneObject::removeNormalWp(struct au_uav_ros::waypoint wp) {
    std::list<waypoint>::iterator i;
    for (i = normalPath.begin(); i != normalPath.end(); i++) {
        if (wp == *i) {
            break;
        }
    }
    if (i != normalPath.end()) {
        normalPath.erase(i);
    } else {
        ROS_ERROR("Waypoint not found");
    }
}

Command PlaneObject::getPriorityCommand(void) {
    //start with defaults
    Command ret;
    ret.planeID = -1;
    ret.latitude = -1000;
    ret.longitude = -1000;
    ret.altitude = -1000;

    //check avoidance queue
    if(currentDest != INVALID_WP)
    {
        //we have an avoidance point, get that one
        ret.planeID = this->id;
        ret.latitude = currentDest.latitude;
        ret.longitude = currentDest.longitude;
        ret.altitude = currentDest.altitude;
	if (currentDest == normalPath.front()) 
        	ret.commandID = COMMAND_NORMAL_WP;
	else
		ret.commandID = COMMAND_AVOID_WP;
    }
    // else if (!plannedPath.empty())
    // {
    //     //we have a point from the planning algorithm
    //     ret.planeID = this->id;
    //     ret.latitude = plannedPath.front().latitude;
    //     ret.longitude = plannedPath.front().longitude;
    //     ret.altitude = plannedPath.front().altitude;
    //     ret.commandID = COMMAND_AVOID_WP;
    // }
    else if (!normalPath.empty())
    {
        //we have a normal path point at least, fill it out
        ret.planeID = this->id;
        ret.latitude = normalPath.front().latitude;
        ret.longitude = normalPath.front().longitude;
        ret.altitude = normalPath.front().altitude;
        ret.commandID = COMMAND_NORMAL_WP;
	currentDest = normalPath.front();
    }

    //fill out our header and return this bad boy
    ret.commandHeader.stamp = ros::Time::now();
    return ret;
}

/*
//user for distributed CA
std::vector<waypoint> PlaneObject::getNormalPath(void) {
    std::vector<waypoint> allWaypoints;
 
	// md
	// Something in A* code causes Coordinator node to crash
	// if it doesn't get any waypoints
    if (normalPath.size() == 0) {
        ROS_ERROR("No normal waypoints! Adding current location...");
        normalPath.push_back(currentLoc);
    }
    allWaypoints.reserve(normalPath.size());
    allWaypoints.insert(allWaypoints.begin(), normalPath.begin(), normalPath.end());


    return allWaypoints;
}
*/
