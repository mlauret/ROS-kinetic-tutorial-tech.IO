#include <ros/ros.h>
#include <std_msgs/String.h>

int main(int argc, char **argv)
{
  //Initialize the ROS Node with the name "talker"
  ros::init(argc, argv, "talker");
  
  //Create a NodeHandle for creating publisher, subscriber, etc.
  ros::NodeHandle n;

  //Create a std_msgs/String publisher on the topic "/chatter" with a queue length of 1000
  ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);

  //Define the rate for publishing the message
  ros::Rate loop_rate(10);

  //Loop while roscore is open
  while (ros::ok())
  {
    //Define a message to send
    std_msgs::String msg = "Hello World";
    //publish the message
    chatter_pub.publish(msg);
    //Wait for 1/loop_rate seconds, to publish at 10Hz
    loop_rate.sleep();
  }

  
  return 0;
}
