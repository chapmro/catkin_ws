/*
standardDefs.h
This file is meant to contain things that are used across multiple executables that don't change
*/

#ifndef _STANDARD_DEFS_H_
#define _STANDARD_DEFS_H_

#include <math.h>
#include "boost/thread.hpp"

//12 meters - set to this because simulator makes 11 meter jumps
#define COLLISION_THRESHOLD 12 //meters
#define CONFLICT_THRESHOLD 24 //meters
#define WAYPOINT_THRESHOLD 30

/*UAV SPECIFIC DEFINES*/
//25 mph = 11.17600 meters / second
#define MPS_SPEED 11.176 
#define MPH_SPEED 25

/*
Many defines for simulator calculations
*/
#define EARTH_RADIUS 6371000 //meters


//APF uses these
#define WEST_MOST_LONGITUDE (-85.490356)	// defines the field location on Earth
#define NORTH_MOST_LATITUDE 32.606573
#define EAST_MOST_LONGITUDE_500M (-85.485018)
#define SOUTH_MOST_LATITUDE_500M 32.6020766
#define EAST_MOST_LONGITUDE_1000M (-85.47968)
#define SOUTH_MOST_LATITUDE_1000M 32.5975802
//latitude and longitude epsilons (~5% of actual distance difference)
#define LONGITUDE_EPSILON (EAST_MOST_LONGITUDE_500M-WEST_MOST_LONGITUDE)/20
#define LATITUDE_EPSILON (NORTH_MOST_LATITUDE-SOUTH_MOST_LATITUDE_500M)/20


//pi radians = 180 degrees
#define DEGREES_TO_RADIANS (M_PI/180.0)
#define RADIANS_TO_DEGREES (180.0/M_PI)

//1 degree latitude ~= 111.2 km
#define LATITUDE_TO_METERS (111200.0)
#define METERS_TO_LATITUDE (1.0/111200.0)

/*
Command Types for Xbee mavlink command types
*/
#define COMMAND_NORMAL_WP 1
#define COMMAND_AVOID_WP 2
#define COMMAND_SET_ID 3
#define COMMAND_SET_STREAMRATE 4

namespace au_uav_ros
{
	//Here's our standard waypoint definition
	struct waypoint
	{
		double latitude;
		double longitude;
		double altitude;
		int planeID;

		waypoint(void) {
			latitude = -1000.0;
			longitude = -1000.0;
			altitude = -1000.0;
			planeID = -1;
		}
	};

	//Mutex to lock serial port read and writes
	boost::mutex serialPort;
	waypoint INVALID_WP;

        struct forceVariables
	{
		double maxForce;				// maximum force imposed by one plane on another, except when they are in conflict radius
		// alpha and beta are parameters that define the bivariate normal potential field
		double alpha;
		double beta;
		// these variables define the limits of the independent/swarm leader force function
		double gamma;
		double alphaTop;
		double betaTop;
		double alphaBot;
		double betaBot;

		// these variables define the limits of the swarm follower force function
		double alphaTopF;
		double betaTopF;
		double alphaBotF;
		double betaBotF;
	};
}

/*
isBlankLine(...)
simple function for parsing to determine is a string is a "blank" line
*/
bool isBlankLine(char str[]);

/*
isValidYesNo(...)
returns true if the character is a 'y', 'Y', 'n', or 'N'
*/
bool isValidYesNo(char c);

/*
distanceBetween(...)
Returns the distance in meters between the two waypoints provided.  Note that it does take into account
the earth's curvature.
*/
double distanceBetween(struct au_uav_ros::waypoint first, struct au_uav_ros::waypoint second);

bool operator==(const struct au_uav_ros::waypoint &wp1, const struct au_uav_ros::waypoint &wp2);

bool operator!=(const struct au_uav_ros::waypoint &wp1, const struct au_uav_ros::waypoint &wp2);
#endif
