/*
RIPNA


This is the header file for RIPNA.cpp, which implements the functions declared here. This file and its comments pertain to the usage of the functions contained in this file.
*/
//TODO What is this?
//#ifndef COLLISION_AVOIDANCE_ALGORITHM_H
//#define COLLISION_AVOIDANCE_ALGORITHM_H

#ifndef _RIPNA_H_
#define _RIPNA_H_

#include <map>

#include "au_uav_ros/planeObject.h"
#include "au_uav_ros/vmath.h"

namespace au_uav_ros{
	
	/*This function is called in collisionAvoidance.cpp and utilizes the other 
	functions outlined in this file to calculate a collision avoidance waypoint 
	for the plane to travel to. If no collision avoidance or maneuvering is 
	necessary, this functions returns the current destination waypoint */
	au_uav_ros::waypointContainer findNewRIPNAWaypoint(PlaneObject &plane1, std::map<int, PlaneObject> &planes);
	
	/*This function receives the current plane and a map of all of the planes 
	in the airspace, and returns the ID of the plane which is the most imminent 
	threat to the current plane. */
	au_uav_ros::threatContainer findGreatestThreat(PlaneObject &plane1, std::map<int, PlaneObject> &planes);
	
	/* This function takes the current plane and its greatest threat and 
	returns a bool which indicates whether the plane should turn right or left */
	bool shouldTurnRight(PlaneObject &plane1, PlaneObject &plane2);
	
	/* This function calculates the desired turning radius based on the ZEM*/
	double calculateTurningRadius(double ZEM);
	
	/* This function takes the current plane, its calculated turning radius, 
	and which direction it should turn in order to find the new collision 
	avoidance waypoint for the plane to go to.*/
	au_uav_ros::waypoint calculateWaypoint(PlaneObject &plane1, double turningRadius, bool turnRight);

	/*This function calculates the next waypoint for the plane based on its 
	distance from its current waypoint and its bearing. */
	au_uav_ros::waypoint takeDubinsPath(PlaneObject &plane);
	
	/* This function takes a plane, its turning radius, and the direction to turn 
	and returns the center of the circle of its turning radius. */
	au_uav_ros::coordinate calculateCircleCenter(PlaneObject &plane, double turnRadius, bool turnRight);

	au_uav_ros::coordinate calculateLoopingCircleCenter(PlaneObject &plane, double turnRadius, bool turnRight);
};


#endif
