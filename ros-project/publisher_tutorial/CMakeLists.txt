cmake_minimum_required(VERSION 2.8.3)
project(ros_publisher_tutorial)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs)

## Declare a catkin package
catkin_package()

add_executable(publisher_tutorial src/publisher_tutorial.cpp)
target_link_libraries(publisher_tutorial ${catkin_LIBRARIES})
