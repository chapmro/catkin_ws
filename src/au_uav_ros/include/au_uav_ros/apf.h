/*
Force

For information about how forces are calculated, visit https://sites.google.com/site/auburn2011uav/.  It is highly recommended that you gain some background about the artificial field approach before delving into the code.

This header file contains a collection of functions used to calculate the force acting on the UAV.  Additionally, removal
of looping is present.
*/

#ifndef FORCE_H
#define FORCE_H

#include <map>
#include <vector>

#include "au_uav_ros/planeObject.h"
#include "au_uav_ros/vmath.h"

namespace au_uav_ros{
	

	/*This function is called in collisionAvoidance.cpp and utilizes the other 
	functions outlined in this file to calculate a collision avoidance waypoint 
	for the plane to travel to. If no collision avoidance or maneuvering is 
	necessary, this functions returns the current destination waypoint */
	au_uav_ros::waypoint findNewAPFWaypoint(PlaneObject &plane1, std::map<int, PlaneObject> &planes);


au_uav_ros::waypoint updatePath(const PlaneObject &plane1, au_uav_ros::mathVector forceVector);


	/*This function receives the current plane and a map of all of the planes 
	in the airspace, and returns the ID of the plane which is the most imminent 
	threat to the current plane. */
	au_uav_ros::threatContainer findGreatestThreat(PlaneObject &plane1, std::map<int, PlaneObject> &planes);

	/*This function calculates the next waypoint for the plane based on its 
	distance from its current waypoint and its bearing. */
	au_uav_ros::waypoint takeDubinsPath(PlaneObject &plane);


	/* This function takes the current plane, its calculated turning radius, 
	and which direction it should turn in order to find the new collision 
	avoidance waypoint for the plane to go to.*/
	au_uav_ros::waypoint calculateWaypoint(PlaneObject &plane1, double turningRadius, bool turnRight);

	au_uav_ros::coordinate calculateLoopingCircleCenter(PlaneObject &plane, double turnRadius, bool turnRight);

	/*Used by findNewAPFWaypoint to setup the parameters */
	void setupForceVars(std::map<int, PlaneObject> &planes);

/*
Sets up variables using names inside forceVars structs. Takes currentParam, which is a vector of parameters that dynamically changes depending on the field size and the number of UAVs present. The actual variables in the parameters list are defined by the user or by some optimization method.
*/
void setupVariables(double currentParam [9]);

	/*
	The primary method used to calculate and sum all forces acting on one plane.  Returns a mathVector representing the 	totalforce acting on the plane; the angle of the vector returned is with respect to Cardinal directions.
	*/
	mathVector calculateForces(PlaneObject &pobj1, std::map<int, PlaneObject> &pobjects, au_uav_ros::forceVariables forceVars);

	/*
	Calculates the repulsion force between two planes.
	The distance parameter is the distance between the planes in meters, maxDistance is
	the distance over which field pobj1 is in acts, rAngle is the angle of the repulsive force, 
	fieldAngle is the angle between the bearing of the plane generating the force to the location
	of pobj1, and aAngle is the angle between the bearing of pobj1 and the location of its destination.
	All angles are in the Cartesian plane.
	*/
	static mathVector calculateRepulsionForce(const PlaneObject &pobj1, double distance, 
					double maxDistance, double rAngle, double fieldAngle, double aAngle, au_uav_ros::forceVariables forceVars);
	
	/*
	Calculates the attractive force to the plane's destination.
	*/
	static mathVector calculateAttractionForce(const PlaneObject &pobj1);
 
	/* 
	Modifies the total force acting on pobj1 so that the new path does not differ more than 22.5 degrees from the current 
	bearing.
	*/
	static void makeForceViable(PlaneObject &pobj1, mathVector &tForce);				
									
	/*
	Returns true if pobj1 is looping around it's destination, false otherwise.
	*/			
	static bool inLoop(const PlaneObject &pobj1, mathVector &tForce);

	/*
	Calculates the distance between the center of "circle" generated when a plane is looping around its destination
	and the plane's destination.  The angle parameter is the number of degrees to the left or right of the UAV the center of
	turning is located.  The angle parameter is based off of the turning angle per second.  Because the simulator
	uses straight line paths between each of the waypoints given, a looping UAV actually creates a hexadecagon.  
	For example, in this code 22.5 is our turning angle. Therefore, the angle provided for this method is either 101.25 or -101.25 since 
	[(180-22.5)/2 = 78.75; 78.75 + 22.5 = 101.25].
	*/
	double findLoopDistance(const PlaneObject &pobj1, double angle);
	

};


#endif
