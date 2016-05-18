#include "au_uav_ros/simPlaneObject.h"
using namespace au_uav_ros;

#define MAXIMUM_TURNING_ANGLE 22.5 //degrees

SimPlaneObject::SimPlaneObject(void) : PlaneObject() {
	simSpeed = 1;
}

SimPlaneObject::SimPlaneObject(struct waypoint wp) : PlaneObject(wp) {
	this->speed = MPS_SPEED;
	simSpeed = 1;

}

void SimPlaneObject::setSimSpeed(double _simSpeed) {
	simSpeed = _simSpeed;
}

double SimPlaneObject::getSimSpeed(void) const {
	return this->simSpeed;
}

bool SimPlaneObject::simulate(au_uav_ros::Telemetry *telem) {
	fillTelemetryUpdate(telem);
	return true;
}

bool SimPlaneObject::handleNewCommand(au_uav_ros::Command newCommand) {
	
	if(this->id != newCommand.planeID)
	{
		return false;
	}
	if (newCommand.commandID == COMMAND_AVOID_WP || newCommand.commandID == COMMAND_NORMAL_WP)  {
		setCurrentDest(newCommand.latitude,
			newCommand.longitude,
			newCommand.altitude);	
	}
	return true;
}

bool SimPlaneObject::fillTelemetryUpdate(au_uav_ros::Telemetry *update) {
	//difference in latitudes in radians
	double lat1 = currentLoc.latitude*DEGREES_TO_RADIANS;
	double long1 = currentLoc.longitude*DEGREES_TO_RADIANS;
	double lat2, long2;

	if (this->currentDest != INVALID_WP) {
		lat2 = currentDest.latitude*DEGREES_TO_RADIANS;
		long2 = currentDest.longitude*DEGREES_TO_RADIANS;
	}else {
		lat2 = normalPath.front().latitude*DEGREES_TO_RADIANS;
		long2 = normalPath.front().longitude*DEGREES_TO_RADIANS;
	}
	
	double deltaLat = lat2 - lat1;
	double deltaLong = long2 - long1;

	//calculate bearing from current position to destination
	double y = sin(deltaLong)*cos(lat2);
	double x = cos(lat1)*sin(lat2) - sin(lat1)*cos(lat2)*cos(deltaLong);
	this->targetBearing = atan2(y, x)*RADIANS_TO_DEGREES;
	

	//calculate the real bearing based on our maximum angle change
	//first create a temporary bearing that is the same as bearing but at a different numerical value
	double tempBearing = -1000;
	if((this->targetBearing) < 0)
	{
		tempBearing = this->targetBearing + 360;
	}
	else
	{
		tempBearing = this->targetBearing - 360;
	}

	double diff1 = abs(this->currentBearing - this->targetBearing);
	double diff2 = abs(this->currentBearing - tempBearing);

	//check for easy to calculate values first
	if(diff1 < (MAXIMUM_TURNING_ANGLE*simSpeed) || diff2 < (MAXIMUM_TURNING_ANGLE*simSpeed))
	{
		//the difference is less than our maximum angle, set it to the bearing
		this->currentBearing = this->targetBearing;
	}
	else
	{
		//we have a larger difference than we can turn, so turn our maximum
		double mod;
		if(diff1 < diff2)
		{
			if(this->targetBearing > this->currentBearing) mod = (MAXIMUM_TURNING_ANGLE*simSpeed);
			else mod = 0 - (MAXIMUM_TURNING_ANGLE*simSpeed);
		}
		else
		{
			if(tempBearing > this->currentBearing) mod = (MAXIMUM_TURNING_ANGLE*simSpeed);
			else mod = 0 - (MAXIMUM_TURNING_ANGLE*simSpeed);
		}

		//add our mod, either +22.5 or -22.5
		this->currentBearing = this->currentBearing + mod;

		//tweak the value to keep it between -180 and 180
		if(this->currentBearing > 180) this->currentBearing = this->currentBearing - 360;
		if(this->currentBearing <= -180) this->currentBearing = this->currentBearing + 360;
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
	*/

	//1) Estimate new latitude using basic trig and this equation
	this->currentLoc.latitude = lat1*RADIANS_TO_DEGREES + ((MPS_SPEED*simSpeed)*cos(this->currentBearing*DEGREES_TO_RADIANS))*METERS_TO_LATITUDE;

	//2) Use the law of haversines to find the new longitude
	double temp = pow(sin(((MPS_SPEED*simSpeed)/EARTH_RADIUS)/2.0), 2); //TODO verify
	temp = temp - pow(sin((this->currentLoc.latitude*DEGREES_TO_RADIANS - lat1)/2.0), 2);
	temp = temp / (sin(M_PI/2.0 - lat1)*sin((M_PI/2.0)-this->currentLoc.latitude*DEGREES_TO_RADIANS));
	temp = 2.0 * RADIANS_TO_DEGREES * asin(sqrt(temp));
	
	//depending on bearing, we should be either gaining or losing longitude
	if(currentBearing > 0)
	{
		this->currentLoc.longitude += temp;
	}
	else
	{
		this->currentLoc.longitude -= temp;
	}

	this->distanceToDestination = distanceBetween(this->currentLoc, this->currentDest);
	update->planeID = this->id;
	update->currentLatitude = this->currentLoc.latitude;
	update->currentLongitude = this->currentLoc.longitude;
	update->currentAltitude = this->currentLoc.altitude;

	update->destLatitude = this->currentDest.latitude;
	update->destLongitude = this->currentDest.longitude;
	update->destAltitude = this->currentDest.altitude;
	update->currentWaypointIndex = this->currentWaypointIndex;
	this->speed = MPS_SPEED*simSpeed; 
	update->groundSpeed = this->speed;
	//TODO: charge name to currentBearing	
	update->targetBearing = this->currentBearing;
	update->distanceToDestination = this->distanceToDestination;
	update->telemetryHeader.stamp = ros::Time::now();
	updateTime();
	
	return true;
}

