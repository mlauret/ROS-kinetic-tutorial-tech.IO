FROM ros:kinetic-ros-core

RUN apt -qq update && apt -y -qq install python-catkin-tools curl git
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt -qq update && apt install -y -qq nodejs build-essential
RUN apt -qq update && apt -y -qq install ros-kinetic-turtlesim

