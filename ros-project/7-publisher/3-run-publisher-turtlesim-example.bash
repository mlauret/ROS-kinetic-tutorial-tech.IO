#!/bin/bash
roscore &
mkdir catkin_workspace
cd catkin_workspace
mkdir src
cd src
catkin_init_workspace .
cd ..
cp -r ../7-publisher/3-publisher-turtlesim-example/ src/publisher_tutorial
catkin_make
source devel/setup.bash
cd ../web-turtlesim
npm start&
sleep 1
rosrun publisher_tutorial publisher_tutorial&
echo "TECHIO> open -p 3000"
sleep 120
