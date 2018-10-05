#!/bin/bash

#get nodejs turtlesim
git clone https://github.com/mlauret/web-turtlesim
cd web-turtlesim
npm install

#Change permission on all files
chmod a+x /project/target/*/*.bash
