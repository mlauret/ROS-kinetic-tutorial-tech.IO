cmake_minimum_required(VERSION 2.8.3)
project(publisher_tutorial)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs) # declare all required package here (must match package.xml <depend>)

## Declare the catkin package specific information
catkin_package(
   INCLUDE_DIRS  #Where to find include dirs from our package
   LIBRARIES ${PROJECT_NAME} #Exported libraries from the project
   CATKIN_DEPENDS roscpp std_msgs #Other catkin project this project depends on
   DEPENDS  #Other non-catkin project this project depends on 
   )

include_directories(  #include directory for compilation
  ${catkin_INCLUDE_DIRS} #Include directories of catkin who have been find_package'ed earlier
)


add_executable(publisher_tutorial src/publisher_tutorial.cpp)
target_link_libraries(publisher_tutorial ${catkin_LIBRARIES})
