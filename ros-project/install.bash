#!/bin/bash

# Install catkin tools for building and curl for npm
apt -qq update && apt -y -qq install python-catkin-tools curl && chmod 777 *.bash


# update and install all required packages (no sudo required as root)
# https://gist.github.com/isaacs/579814#file-only-git-all-the-way-sh
apt-get update -yq && apt-get upgrade -yq && \
apt-get install -yq g++ libssl-dev apache2-utils curl git python make nano

# install latest Node.js and npm
# https://gist.github.com/isaacs/579814#file-node-and-npm-in-30-seconds-sh
mkdir ~/node-latest-install && cd $_ && \
curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1 && \
make install && \ # takes a few minutes to build...
curl https://www.npmjs.org/install.sh | sh


#get nodejs turtlesim
git clone https://github.com/mlauret/web-turtlesim
cd web-turtlesim
npm install
