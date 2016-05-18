Auburn ATTRACT
==============

Unmanned aerial vehicles ( **UAVs** ) are increasing in popularity and usability in many civil and military applications.  For a safe deployment of a fleet of UAVs operating over a limited airspace, collision avoidance is needed.  To solve this issue, Auburn University launched a project to fly autonomously, safely, and efficiently six to twelve UAVs.  This project ( **ATTRACT** ) aims to design and implement an Aerial and Terrestrial Testbed for Research in Aaerospace, Computing, and maThematics.  The au_uav_pkg contains everything involved in the Auburn ATTRACT project.


Key Components
--------------

1. Coordinator - Monitors and coordinates all of the UAVs.

2. Collision Avoidance - Monitors all of the UAVs and decides if a collision avoidance maneuver is necessary.

3. Simulator - Mimics real UAVs by simulating their main components.

4. XBeeIO - Integrates real UAVs through a X-Bee telemetry module.

5. au_uav_gui - QT modules used to visualize the UAVs.

6. Launch files - Inherited from ROS; files used to specify which parts of the system to launch.

7. Course files - A basic system for creating missions for a fleet of UAVs.


Installing ROS
--------------

Before you can clone and use the au_uav_pkg, the Robot Operating System ( **ROS** ) must be setup on your system.  ROS is required to run on unix-based operating systems.  A decision must be made prior to installing ROS: Installing and maintaining a personal unix operating system or using a Virtual Machine with a linux operating system.  For ease of installation, I recommend using a VM.  You can download the VM at http://nootrix.com/downloads (The Groovy Galapagos Version).  In order to install the VM, you will also need to download VirtualBox provided at http://www.virtualbox.org/wiki/Downloads.  If you choose to dual-boot operating systems or have a working version of a unix-based operating system, then simply follow the ROS installation instructions at http://www.ros.org/wiki/ROS/Installation (Make sure to follow the Groovy/catkin instructions).

After ROS is installed, you can now fork the au_uav_pkg repository. 
 
1. Fork the "au_uav_pkg" repository by clicking the "Fork" button on the github website.  Note:  A more detailed description of forking can be found at help.github.com/articles/fork-a-repo.

2. It's convenient if the ROS environment variables are automatically added to your bash session every time a new shell is launched.  Configure your .bashrc file by typing the following commands:
```
echo "source ~/catkin_ws/devel/setup.bash" >> .bashrc
echo "export ROS_WORKSPACE=/home/viki/catkin_ws" >> .bashrc
source .bashrc
```

You can now set up your github Fork within your catkin_ws folder.  Refer to github.com for more instructions.


Building
--------

To build the au_uav_pkg navigate to your catkin_ws.  Once you are in the catkin_ws enter the following command:
```
catkin_make
```

Launching
---------

To run the au_uav_pkg navigate to your catkin_ws.  Once your are in the catkin_ws, and you have already built the au_uav_pkg, launch the system by entering the following command:
```
roslaunch au_uav_ros launch.launch 
```

NOTE: parameters can be added to the launch command. To see which parameters are available, refer to my Thesis, or to the .launch files.
