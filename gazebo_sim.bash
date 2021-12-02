#!/bin/bash

#Input Gazebo world name
echo "[List of Gazebo world]"
ls ~/PX4-Autopilot/Tools/sitl_gazebo/worlds

read -p "Please Enter the World : " world
if [ -z ${world} ] ; then
world="empty"
fi

#Input Gazebo Iris model name
model_path=~/PX4-Autopilot/Tools/sitl_gazebo/models
echo "[List of Iris model]"
find $model_path -type d -name 'iris*' -exec basename {} \;
read -p "Please Enter the Iris model : " iris_name
if [ -z ${iris_name} ] ; then
iris_name="iris_fpv_cam"
fi

cd ~/PX4-Autopilot
#DONT_RUN=1 make px4_sitl_default gazebo
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo

#roslaunch mavros px4.launch fcu_url:="udp://:14540@192.168.1.36:14557"

#Gazebo world PATH
world_path=~/PX4-Autopilot/Tools/sitl_gazebo/worlds/

roslaunch px4 posix_sitl.launch world:="${world_path}${world}.world" sdf_model:="$iris_name"
