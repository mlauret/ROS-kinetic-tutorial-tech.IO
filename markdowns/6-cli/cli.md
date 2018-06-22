# Command Line Interface

## A gentle introduction : 

Before beeing a set of packages, nodes, and compilation error, your ROS environnement is a set of CLI tools used to generate workspace, packages, compile them and launch them.

Here is an example of CLI for a ROS environmnent : 
@[Example : Click run to open a terminal]({"command": "./6-cli/1-simple-cli/open_terminal.bash"})
  
> Ok cool, I have a terminal, I feel like a hacker, now what ?

You have a lot of CLI tools shipped with ROS. Here is some of them : 

- roscd
- rosls
- rosed
- roscp
- rosrun
- rosdep
- rosrun
- roslaunch
- rosmsg
- rosnode
- rospack
- rosparam
- rossrv
- rosservice
- rostopic
- rosversion
- catkin_make

There is some other tools used by ros in CLI, but since I never saw them used by anybody, and some of them are deprecated (officialy or not), I will not describe them : 
- rospd
- rosd
- rosstack 
- rosmake
- roslocate (removed)
- roscreate


> Wait, where is catkin build ?

Catkin Tools (catkin build) aim to be a replacement for catkin_make. It still in beta. Therefore, it's not shipped with ROS. You need to install it manually. This tutorial will give you catkin tools AND catkin_make, but only catkin tools will be used. You can try it with catkin_make (catkin_make is catkin build, etc.).


## Let's ros*

### Navigating in ROS

`rospack`, `roscd` and `rosls`, your 3 best tools for navigating in ROS :
- `rospack` is used to find, list and describe packages.
- `roscd` is used to go in a ROS package directory.
- `rosls` is used to list a ROS package files and directories.

The common usage of these tools are : 

`rospack list` : to list all the package in your ROS environment.

`rospack find <package>` : to see where <package> is in the ROS environment.

`rospack depends <package>` : to list all ros package dependencies of <package>.

`rospack depends-on <package>` : to list all package that use <package>.

`roscd <package>` will change the current directory to where <package> is.

`rosls <package>` will list all files and directories where <package> is.

Try in this terminal theses commands : 
@[Exercise 1]({"command": "./6-cli/1-simple-cli/open_terminal.bash"})

Now let's see if you can find : 

?[What is the content of the directory of the package "rosbag"]
-[x] cmake/ and package.xml
-[ ] cmake/, package.xml and CMakeLists.txt
-[ ] msg/, srv/, src/, package.xml and CMakeLists.txt
-[ ] src/, scripts/ and CmakeLists.txt

?[Where is the package "std_msgs" ?]
-[ ] /usr/share/std_msgs
-[x] /opt/ros/kinetic/share/std_msgs
-[ ] /home/ros/catkin_ws/src/std_msgs
-[ ] /opt/ros/std_msgs

?[On which package "trajectory_msgs" does NOT depends ?]
-[ ] std_msgs
-[ ] catkin
-[ ] genpy
-[x] rosbuild

?[What package does NOT use the package "rosparam" ?]
-[ ] roswtf
-[ ] roslaunch
-[ ] rostest
-[x] rosftw


