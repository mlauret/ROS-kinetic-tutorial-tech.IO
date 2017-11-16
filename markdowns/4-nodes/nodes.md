# Nodes

In a typical ROS application, only 2 things exists : 

- The roscore
- Nodes

Nodes can also be nodelets, but it's a special kind of node described later. And also, roscore is just the name of the executable who start a `rosmaster`, a `parameter server` and the `rosout` logging system. But for simplicity, we will just call it roscore.

The roscore is the postman, it's in charge of delivering the correct message to the correct recipient. The node can be the expediter or the recipient, or both, very often both.

So, just like in a post system, nodes need to tell the roscore : "Hey i'm here, I need this", or "Hey, I want to send this !"

We call this a `Subscriber` (who `subscribe`) and a `Publisher` (who `advertise` and `publish`). 

A Subscriber will ask the roscore to send to it all messages of a certain `type` and on a certain `topic`. example : 
- Node :  I'm the node "super_subscriber".
- Node :  I need all message of type "std_msgs/String".
- Node :  Who come from the topic "/chatter".
- roscore : Ok, here is a message!
- Node : Thanks you bro, I received it.

In ROS, here how we call this  :
- Node : Initialize and register the node name "super_subscriber" on roscore.
- Node : Subscribe to the topic "/chatter" with the message type "std_msgs/String".
- roscore : A message of type "std_msgs/String" on the topic "/chatter" was published.
- Node : Received the message.


A Publisher will need to register himself as a publisher and publish the message. example : 
- Node : I'm the node "cool_publisher".
- Node : I will send message of type "std_msgs/String" on the topic "/chatter"
- roscore : Ok, I keep me in touch when you send a message.
- Node : This is timely, I want to send the message "Hello".
- roscore : Ok, message send.

Again, in ROS tongue : 
- Node : Initialize and register the node name "cool_publisher" on roscore.
- Node : Create a publisher "pub" and Advertise on the topic "/chatter" with the message type "std_msgs/String"
- roscore : Ok, no error.
- Node : Build the message "msg" who contain : "data: Hello" and send it trought "pub"
- roscore : Ok, no error.

