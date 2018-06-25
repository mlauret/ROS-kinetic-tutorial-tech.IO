#!/bin/bash
roscore &
echo "TECHIO> terminal -i 'source /opt/ros/kinetic/setup.bash'"
mkdir catkin_workspace
cd catkin_workspace
mkdir src
cd src
catkin_init_workspace .
cd ..
cp -r ../7-publisher/1-publisher-example/ src/publisher_tutorial
catkin_make
source devel/setup.bash
rosrun publisher_tutorial publisher_tutorial &
rostopic echo /chatter&
sleep 5
echo "TECHIO> success"
