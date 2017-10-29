#!/bin/bash
echo TECHIO> terminal
mkdir catkin_workspace
mkdir src
cd src
catkin_init_workspace .
mkdir publisher_tutorial
cd ..
cp -r ../publisher_tutorial/ src/.
catkin_make
source devel/setup.bash
roscore&
rosrun publisher_tutorial publisher tutorial
