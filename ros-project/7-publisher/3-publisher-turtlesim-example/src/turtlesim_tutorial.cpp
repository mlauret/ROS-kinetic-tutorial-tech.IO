#include <ros/ros.h>
#include <geometry_msgs/Twist.h>

int main(int argc, char **argv)
{
  //Initialize the ROS Node with the name "turtlesim_velocity"
  ros::init(argc, argv, "turtlesim_velocity");
  
  //Create a NodeHandle for creating publisher, subscriber, etc.
  ros::NodeHandle n;

  //Create a geometry_msgs/Twist publisher on the topic "/turtle1/cmd_vel" with a queue length of 10
  ros::Publisher velocity_pub = n.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 10);

  //Define the rate for publishing the message
  ros::Rate loop_rate(10);

  //Define the message to send
  geometry_msgs::Twist msg;
  msg.linear.x = 1;
  msg.angular.z = 1;
  
  //Loop while roscore is open
  while (ros::ok())
  {
    //publish the message
    velocity_pub.publish(msg);
    //Wait for 1/loop_rate seconds, to publish at 10Hz
    loop_rate.sleep();
  }

  
  return 0;
}
