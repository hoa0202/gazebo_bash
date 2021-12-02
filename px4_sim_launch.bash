#!/bin/bash

cd ~/PX4-Autopilot
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo

#roslaunch mavros px4.launch fcu_url:="udp://:14540@192.168.1.36:14557"

roslaunch mavros px4.launch fcu_url:="udp://:14540@127.0.0.1:14557"
#roslaunch px4 posix_sitl.launch

#roslaunch mavros px4.launch
