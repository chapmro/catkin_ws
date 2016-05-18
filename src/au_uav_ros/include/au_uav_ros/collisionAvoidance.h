#ifndef _COLLISION_AVOIDANCE_H_
#define _COLLISION_AVOIDANCE_H_

#include <vector>

#include "au_uav_ros/Telemetry.h"

#include "au_uav_ros/planeObject.h"
#include "au_uav_ros/simPlaneObject.h"
#include "au_uav_ros/standardFuncs.h"
//#include "au_uav_ros/ripnaCONES.h"

//RIPNA Includes
#include "au_uav_ros/ripna.h"
#include "au_uav_ros/ipn.h"

//APF Includes
#include "au_uav_ros/apf.h"

namespace au_uav_ros {
	class CollisionAvoidance {
	private:
		
	public:
		// collision avoidance call for R Inverse Proportional Navigation Algorithm
		virtual void ripnaAvoid(int id, 
				std::map<int, au_uav_ros::PlaneObject> planes, 
				std::map<int, au_uav_ros::SimPlaneObject> simPlanes,
				std::vector<waypoint> &wps);
		void apfAvoid(int id, 
				std::map<int, PlaneObject> planes, 
				std::map<int, SimPlaneObject> simPlanes,
				std::vector<waypoint> &wps);
			
	

		// collision avoidance call for Collision Cones
		/*virtual void ccAvoid(int id, 
				std::map<int, au_uav_ros::PlaneObject> planes, 
				std::map<int, au_uav_ros::SimPlaneObject> simPlanes,
				std::vector<waypoint> &wps);*/

		void distrubuted_avoid(int id, 
				std::map<int, PlaneObject> planes, 
				std::map<int, SimPlaneObject> simPlanes,
				waypoint &avoidanceWP);
	};
}
#endif
