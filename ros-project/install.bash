#!/bin/bash

# Install catkin tools for building and curl for npm
apt -qq update && apt -y -qq install python-catkin-tools curl && chmod 777 *.bash

apt-get update -yq && apt-get upgrade -yq && \
apt-get install -yq curl git nano
curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
apt-get install -yq nodejs build-essential


#get nodejs turtlesim
git clone https://github.com/mlauret/web-turtlesim
cd web-turtlesim
/usr/lib/node_modules/npm/bin/npm install
