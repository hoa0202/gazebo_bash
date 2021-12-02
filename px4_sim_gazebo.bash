#!/bin/bash

cd ~/PX4-Autopilot
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo

#roslaunch mavros px4.launch fcu_url:="udp://:14540@192.168.1.36:14557"
#DONT_RUN=1 make px4_sitl_default gazebo
#DONT_RUN=1 make px4_sitl gazebo_typhoon_h480 gazebo
# make px4_sitl gazebo_typhoon_h480
roslaunch px4 posix_sitl.launch
