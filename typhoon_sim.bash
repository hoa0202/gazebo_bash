#!/bin/bash

#Input Gazebo world name
echo "[List of Gazebo world]"
ls /root/PX4-Autopilot/Tools/sitl_gazebo/worlds

read -p "Please Enter the World : " world
if [ -z ${world} ] ; then
world="empty"
fi

#Input Gazebo Vehicle model name
model_path=/root/PX4-Autopilot/Tools/sitl_gazebo/models
echo "[List of vehicle model]"
find $model_path -type d -name 'iris*' -exec basename {} \;
echo "default = typhoon"
read -p "Please Enter the Vehicle model : " vehicle_name


if [ -z ${vehicle_name} ] ; then
vehicle_name="iris_custom"
fi


cd ~/PX4-Autopilot
#DONT_RUN=1 make px4_sitl_default gazebo
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo

#roslaunch mavros px4.launch fcu_url:="udp://:14540@192.168.1.36:14557"

#Gazebo world PATH
world_path=/root/PX4-Autopilot/Tools/sitl_gazebo/worlds/

if [ ${vehicle_name} == "typhoon" ] ; then
roslaunch px4 posix_sitl.launch world:="${world_path}${world}.world" vehicle:="typhoon_h480" sdf_model:="typhoon_h480"
else
roslaunch px4 posix_sitl.launch world:="${world_path}${world}.world" sdf_model:="${vehicle_name}"
fi
