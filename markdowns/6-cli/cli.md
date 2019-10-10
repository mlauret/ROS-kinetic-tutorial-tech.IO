# Command Line Interface

## A gentle introduction : 

Before beeing a set of packages, nodes, and compilation error, your ROS environnement is a set of CLI tools used to generate workspace, packages, compile them and launch them.

Here is an example of CLI for a ROS environmnent : 
@[Example : Click run to open a terminal]({"command": "./6-cli/1-example-terminal.bash"})
  
> Ok cool, I have a terminal, I feel like a hacker, now what ?

You have a lot of CLI tools shipped with ROS. Here is some of them : 

- roscd
- rosls
- rospack
- rosdep
- rosrun
- roslaunch
- rosmsg
- rosnode
- rossrv
- rosparam
- rostopic
- rosservice
- catkin_make
- rosversion

There is some other tools used by ros in CLI, but since I never saw them used by anybody or you don't really need them, and some of them are deprecated (officialy or not), I will not describe them :
- roscp
- rosed
- rospd
- rosd
- rosstack
- rosmake
- roslocate
- roscreate



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

#### Exercise 1

Try theses command in a terminal : 
@[Exercise 1]({"command": "./6-cli/1-example-terminal.bash"})

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

?[What package does NOT exist ?]
-[ ] roswtf
-[ ] roslaunch
-[ ] rostest
-[x] rosftw


### Let's run some nodes

To run a single node, you will need the `rosrun` command.
But if you try to launch it right now in a CLI, it won't work. Some problem about a `Failed to contact master at [localhost:11311].  Retrying...`.

To launch a single node, you will first need to launch `roscore`.
You don't need to launch it on any CLI on this tutorial, they are already running roscore.

The full Command is : `rosrun <package> <node>`

For example, launching the node `teleop_twist_keyboard.py` from the package `teleop_twist_keyboard` :

`rosrun teleop_twist_keyboard teleop_twist_keyboard.py`

Every single node are launched like this, with some special arguments :

- You can add parameters to rosrun commands `rosrun package node _param:=value`
- You can remap topics (change topics name) : `rosrun package node old_topic_name:=new_topic_name`

(Be carefull, parameter begin with a `_` while topic remapping don't)

