#!/bin/bash

# Install catkin tools for building
apt -qq update && apt -y -qq install python-catkin-tools && chmod 777 *.bash


# Install Docker CE for running Nodejs TurlteSim
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh


# Get Nodejs Turtlesim from dockerhub
docker pull mathieula/web-turtlesim
