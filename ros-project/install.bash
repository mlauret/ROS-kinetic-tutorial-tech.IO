#!/bin/bash

# Install catkin tools for building and curl for npm
apt -qq update && apt -y -qq install python-catkin-tools curl && chmod 777 *.bash


#install nvm
curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

#Install nodejs and npm
source $NVM_DIR/nvm.sh \
    && nvm install 6 \
    && nvm alias default 6 \
    && nvm use default
    
export NODE_PATH=$NVM_DIR/v6/lib/node_modules
export PATH=$NVM_DIR/versions/node/v6/bin:$PATH

#get nodejs turtlesim
git clone https://github.com/mlauret/web-turtlesim
cd web-turtlesim
npm install
