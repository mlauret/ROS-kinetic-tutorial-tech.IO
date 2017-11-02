#!/bin/bash
roscore &
echo "TECHIO> terminal"
mkdir catkin_workspace
cd catkin_workspace
mkdir src
cd src
catkin_init_workspace .
cd ..
cp -r ../publisher_tutorial/ src/.
catkin_make
source devel/setup.bash
rosrun publisher_tutorial publisher_tutorial &
rostopic echo /chatter
