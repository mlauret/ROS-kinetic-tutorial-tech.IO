
This chapter is totally optional, you can skip directly to the next one, it's just here to help you install ROS.

The complete installation procedure without explanation is available [here](http://wiki.ros.org/kinetic/Installation/Ubuntu)

Also, this installation is for Ubuntu 15.10 or 16.04, other distribution have different ways of installation.

So, open a terminal and follow these step : 

## Step 1 : Link your distribution to the ROS package repository

If you don't know, most linux distribution works with packages repositories. It's like the "Google play store" of Linux (more free). But in the case of linux, everyone can create their own store to publish application. By default, you only have access to the main ubuntu repositories, with security update and many useful application.

All ROS developper send their application to a unique store, the ROS repository. To add it in Linux, you need to create a `sources.list` file in your linux distribution.

To create this file just follow theses steps : 
1. `sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'`

And that all.

This complicated line will : 
1. Give you the superuser right to write file in critical system directories with `sudo`
2. Launch a shell command with `sh -c`
3. The shell command is `echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list`, it will write the line "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" in /etc/apt/sources.list.d/ros-latest.list
4. But there is a catch : ` $(lsb_release -sc) ` will expand (it's a subcommand) and will change to your distribution name, in our case "xenial" (codename for ubuntu 16.04) or "wily" (for 15.10)

And that all for linking you linux to the ROS package repository.

## Step 2 : Get the public key for updating your package

Linux will throw an error if you want to update package from the ROS package repository, because even if you added them, linux don't trust them because they may be compromised by a malicious hacker. You need to add the ROS package repository public key, which is a key used to check if the packages are signed by ROS.

You can just launch `sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654`

This will add the public key from ROS to your distribution, and will definitely let you install ROS packages from the repository.

### If this didn't worked 

Try using an another keyserver :
`sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654`

If this still doesn't works, you can try this command if you are begin a proxy :
`curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -`

They will all do the same thing.

## Step 3 : Update your package list

Because linux know every installable application in a list with the command `apt-get` (or simply `apt`), you need to tell him to update the packages lists every time you add a repository or from time to time when a new package is available in the repository.

Just run the command `sudo apt-get update` and the apt will know all packages available.


## Step 4 : Install ROS

If you know a little bit about Ubuntu, you will know that there is a command to install application : `sudo apt-get install`.
Now, you can install ros with the command : 

`sudo apt-get install ros-kinetic-desktop-full`

it will download all mandatory package for ROS, plus a lot of usefull packages for debugging and simulating robots.


## Step 5 : Initialize rosdep

Rosdep is a useful command in ROS, that allow you to download all dependencies from a package.

To initialize rosdep, just run :
`sudo rosdep init`
`rosdep update`

Example : a friend of you gave you a custom package he built, who work well, but he didn't gave you all the dependencies needed by his package to be built. By running `rosdep` (not only this command, but a longer command described [here](http://wiki.ros.org/rosdep)), you will directly install all dependencies without worrying to install them manually.



## Step 6 : Automatize your environment

Right now, you can use ROS package and build your own. But everytime you open a terminal, you will have to type : 

`source /opt/ros/kinetic/setup.bash`

Which is pretty annoying and you can totally automatize this command by adding it in your `.bashrc`.

.bashrc is a file in Ubuntu that is launched everytime a new terminal is opened. It contains various commands related to the autocompletion (with "tab-tab"), terminal color and many other things. Don't touch it when you don't know what you are doing.

You can simply run the command : `echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc`

This command will add the `source /opt/ros/kinetic/setup.bash` commands at the end of the file .bashrc.

Now, everytime you open a terminal, you will always have the ROS related commands without manually sourcing the ROS environment.


## Quizz time
(because people remember better when they are questionned)

?[What do the command `rosdep` ?]
-[x] It display a help screen
-[ ] It install my package dependencies
-[ ] It install all the dependencies of the packages in my workspace 
-[ ] It install all the new packages from the sources.list

?[I'm on Ubuntu 16.04 and I installed ROS. What is written in the file /etc/apt/sources.list.d/ros-latest.list ?]
-[ ] echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main"
-[ ] echo "deb http://packages.ros.org/ros/ubuntu wily main"
-[ ] echo "deb http://packages.ros.org/ros/ubuntu xenial main"
-[ ] deb http://packages.ros.org/ros/ubuntu wily main
-[x] deb http://packages.ros.org/ros/ubuntu xenial main

?[What do the command `sudo apt-get update` ?]
-[ ] It download all new package from the sources.list
-[x] It update the package list
-[ ] It install all the new packages from the ROS package list
-[ ] It install all the new packages from the sources.list

?[What do the command `rosdep install --from-paths src --ignore-src -r -y` ?]
-[ ] It display a help screen
-[ ] It install my package dependencies
-[x] It install all the dependencies of the packages in my workspace 
-[ ] It install all the new packages from the sources.list
