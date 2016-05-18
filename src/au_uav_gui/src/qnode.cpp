/***************************************************
 Coder: Jacob Dalton Conaway - jdc0019@auburn.edu
 Reviewer/Tester: Kayla Casteel - klc0025@auburn.edu
 Senior Design - Spring 2013
 Sources are in-line
 TODO: Finish Commenting and Proofread Comments
 ***************************************************/

#include <ros/ros.h>
#include <ros/package.h>
#include <ros/network.h>
#include <string>
#include <std_msgs/String.h>
#include <QDebug>
#include "au_uav_gui/qnode.hpp"
#include "au_uav_gui/Telemetry.h"
#include "au_uav_gui/SendFilePath.h"
#include "au_uav_gui/flightvisualization.hpp"
#include <QFileDialog>
#include <QMessageBox>
#include "au_uav_gui/constants.h"
#include <signal.h>

QNode::QNode(int argc, char ** argv) :
    init_argc(argc), init_argv(argv)
{
}

QNode::~QNode()
{
    if (ros::isStarted()) {
	std_msgs::String msg;
	msg.data = "bro";
	shutdown_pub.publish(msg);
        ros::shutdown();    // explicitly needed since we use ros::start();
        ros::waitForShutdown();
    }
    wait();
}

void QNode::telemetryCallback(
    const au_uav_gui::Telemetry::ConstPtr & msg)
{
    long double longitude = msg->currentLongitude;
    long double latitude = msg->currentLatitude;
    long double wp_Longitude = msg->destLongitude;
    long double wp_Latitude = msg->destLatitude;
    long double bearing = msg->targetBearing;
    int planeID = msg->planeID;
    emit newCoordinates(double(latitude), double(longitude), double(bearing),
                        planeID);
    emit updateWayPoint(double(wp_Latitude), double(wp_Longitude), planeID);
    emit updatePlaneInfo(msg->planeID, msg->currentLatitude,
                         msg->currentLongitude, msg->currentAltitude, msg->groundSpeed,
                         msg->targetBearing, msg->currentWaypointIndex,
                         msg->distanceToDestination);
}

QString QNode::getPackagePath()
{
    return QString::fromStdString(
               ros::package::getPath(ROS_PKGE_NAME.toStdString()));
}

void QNode::sendFilePath()
{
    au_uav_gui::SendFilePath srv;
    QString path = getPackagePath();
    path.append(COURSE_DIR_POSTFIX);

    QString filename = QFileDialog::getOpenFileName(NO_PARENT, OPEN_FILE_TITLE,
                       path, COURSE_FILE_TYPE);
    srv.request.filename = filename.toStdString().c_str();
    if (sendFileNameClient.call(srv)) {
        //emit filePathSent();
        return;
    } else {
        QMessageBox::warning(NO_PARENT, WARNING_TITLE, NO_ROS_NODE_WARNING,
                             QMessageBox::Ok);
    }
}

bool QNode::init()
{
    ros::init(init_argc, init_argv, GUI_PACKAGE_NAME.toStdString());

    if (!ros::master::check()) {
        QMessageBox::warning(NO_PARENT, WARNING_TITLE, NO_ROS_NODE_WARNING,
                             QMessageBox::Ok);
        return false;
    }

    ros::start(); // explicitly needed since our nodehandle is going out of scope.
    ros::NodeHandle n;

    // subscribe to telemetry updates
    telem_sub = n.subscribe(TELEM_TOPIC.toStdString(), SUB_QUEUE_SIZE,
                            &QNode::telemetryCallback, this);

    sendFileNameClient = n.serviceClient < au_uav_gui::SendFilePath
                         > (SEND_FILE_SRV_NAME.toStdString());
    shutdown_pub = n.advertise<std_msgs::String>("master_shutdown",1000);
    start();

    return true;
}

void QNode::run()
{
    ros::spin();
}
