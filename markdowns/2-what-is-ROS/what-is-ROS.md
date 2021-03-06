# What is ROS ?

`ROS is an open-source, meta-operating system for your robot` - http://wiki.ros.org/ROS/Introduction

Meaning : ROS is a tool, a middleware, to connect any hardware to any application

> A middleware ?

A software layer between the hardware (Computer, Robot, Sensors, etc.) and the application ( [Follow an object](https://www.youtube.com/watch?v=4B_aEEaosyw), [Pilot a helicopter](https://www.youtube.com/watch?v=nMAK3uQ3rCc), [etc.](https://vimeo.com/245826128)).

## Example

You can see ROS as a plumbing system : 

- Your application is the Tap

- ROS is the Pipe, Tank and Valve.

- Your hardware is the Source

- Your hardware driver is the Pump

- (and the user drink water)


You can picture a typical ROS application like this : 

- You connect the Hardware to the Operating system (Ubuntu Linux in most of the case)

- Linux launch the hardware driver (Ex: USB driver for camera, for joystick)

- You connect ROS to this driver with the help of a 'package'

- The package will send 'message' (data) through ROS infrastruture (Remember 
the Pipe and Valve ?)

- You have one or more application that use these 'message', those application 
are also 'package'.

- ROS will automatically transfer the messages to the correct application.

&nbsp;

Example for displaying a webcam video on your screen : 

- You launch ROS

- You connect any of [these webcam](http://www.ideasonboard.org/uvc/) to you computer.

- You launch the [libuvc_camera node](http://wiki.ros.org/libuvc_camera), a package to send image message in ROS

- You launch the [rqt_image_view node](http://wiki.ros.org/rqt_image_view), a package that display image on a GUI

- Enjoy seeing the image on a GUI.

That seem utterly difficult to display an image, but other package exist to use this image message for [reading 1D/2D barcode](https://github.com/ros-drivers/zbar_ros) or [detecting any object](http://wiki.ros.org/find_object_2d)

The main power of ROS is the community. Since 10 years, the community have developped a TON of package for every application.

Fun fact : I didn't have to code a single line of C++ or Python for mapping a Mars's zone with the help of [VREP](http://www.coppeliarobotics.com/) and [Octomap](http://wiki.ros.org/octomap_server) : [Result in this video](https://www.youtube.com/watch?v=2V11_CEwZM8&t=3s).

But more than that, ROS give you a set of tools to allow you to create, install, uninstall and share packages. So if a package doesn't exist, you can always create it (and share it, if you want).
The main coding language are C++ and Python. You can also use Lisp and other language, but some setup will be required.

# What do I need for this tutorial ?

You will need : 

- Some times and courage

- Python skills

#### Should I use Python or C++ for ROS?

Most people will tell you to use Python : It's easier, faster to learn and code, cleaner when you are a beginner.

I recommend you to choose your favorite language (You can even use Lisp in ROS but I will not cover it in the tutorial), C++ will allow you to code a [faster application](https://benchmarksgame.alioth.debian.org/u64q/compare.php?lang=python3&lang2=gpp), but a bad C++ code will be much more slower and difficult to maintain than a simple python code.


## You can skip to chapter 3 for installation procedure (totally optionnal here), chapter 4 to a full introduction or chapter 6 to begin exercises.