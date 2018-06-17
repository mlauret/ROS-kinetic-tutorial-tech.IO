#!/bin/bash

# Install catkin tools for building
apt -qq update && apt -y -qq install python-catkin-tools && chmod 777 *.bash


# Install Docker CE for running Nodejs TurlteSim

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt -qq update
apt -y -qq install docker-ce



# Get Nodejs Turtlesim from dockerhub

docker pull mathieula/web-turtlesim
