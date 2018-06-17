#!/bin/bash
roscore &
mkdir catkin_workspace
cd catkin_workspace
mkdir src
cd src
catkin_init_workspace .
cd ..
cp -r ../publisher_tutorial/ src/.
catkin_make
source devel/setup.bash
cd ../web-turtlesim
npm start&
echo "TECHIO> open -p 3000"
rosrun publisher_tutorial publisher_tutorial &
rostopic echo /chatter