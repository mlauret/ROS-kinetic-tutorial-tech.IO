cmake_minimum_required(VERSION 2.8.3)
project(ros_publisher_tutorial)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs)

## Declare the catkin package specific information
catkin_package(
   INCLUDE_DIRS include ##Where to find include dirs
   LIBRARIES ${PROJECT_NAME} #Exported libraries from the project
   CATKIN_DEPENDS roscpp std_msgs #Other catkin project this project depends on
   DEPENDS ) #Other non-catkin project this project depends on

add_executable(publisher_tutorial src/publisher_tutorial.cpp)
target_link_libraries(publisher_tutorial ${catkin_LIBRARIES})
