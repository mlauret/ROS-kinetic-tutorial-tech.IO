# Nodes

In a typical ROS application, only 2 things exists :

- The roscore
- Nodes

Nodes can also be nodelets, but it's a special kind of node described later. And also, roscore is just the name of the executable who start a `rosmaster`, a `parameter server` and the `rosout` logging system. But for simplicity, we will just call it roscore.

The roscore is the postman, it's in charge of delivering the correct message to the correct recipient. The node can be the expediter or the recipient, or both, very often both.

So, just like in a post system, nodes need to tell the roscore : "Hey i'm here, I need this", or "Hey, I want to send this !"

We call this a `Subscriber` (who `subscribe`) and a `Publisher` (who `advertise` and `publish`).

A Subscriber will ask the roscore to send to it all messages of a certain `type` and on a certain `topic`. example : 
- Node Subscriber :  I'm the node **"super_subscriber"**.
- Node Subscriber :  I need all message of type **"std_msgs/String"**.
- Node Subscriber :  Who come from the topic **"/chatter"**.
- roscore : Ok!
 
Later...

- roscore : There is a message !
- Node Subscriber : Thanks you, I received it.

In ROS, here how we call this  :
- Node Subscriber : Initialize and register the node name **"super_subscriber"** on roscore.
- Node Subscriber : Subscribe to the topic **"/chatter"** with the message type **"std_msgs/String"**.

Later... 

- roscore : A message of type **"std_msgs/String"** on the topic **"/chatter"** was published.
- Node Subscriber : Received the message.


A Publisher will need to register himself as a publisher and publish the message. example :
- Node Publisher : I'm the node **"cool_publisher"**.
- Node Publisher : I will send message of type **"std_msgs/String"** on the topic **"/chatter"**
- roscore : Ok, keep me in touch when you send a message.

Later...

- Node Publisher : I want to send the message **"Hello"**.
- roscore : Ok, message send.

Again, in ROS tongue : 
- Node Publisher : Initialize and register the node name **"cool_publisher"** on roscore.
- Node Publisher : Create a publisher **"pub"** and Advertise on the topic **"/chatter"** with the message type **"std_msgs/String"**
- roscore : Ok.

Later...

- Node Publisher : Build the message **"msg"** who contain : **"data: Hello"** and send it trought **"pub"**
- roscore : Ok, message distributed.

## About this topic things

A [topic](http://wiki.ros.org/Topics) is just a channel where message go through, a way for the roscore to know **who** send **what** and **how**.

A topic consist of :

1. A `topic name` ([naming](http://wiki.ros.org/Names))
2. A `topic type` (message type)
3. `publishers` (1 to Many)
4. `subscribers` (1 to Many)

On the previous example, we have : 

1. The `topic name` **"/chatter"**
2. The `topic type` **"std_msgs/String"**
3. The `publisher` **"cool_publisher"**
4. The `subscriber` **"super_subscriber"**

Just remember, topics can have multiple subscriber/publisher.


## Why this complexity

Actually, it's meant to ease the access, coding and debug.
This kind of architecture is a [Microservice](https://en.wikipedia.org/wiki/Microservices/) architecture. It allow to code and debug only small part of code.
All ROS Nodes are built for being as simple as possible, 1 Node will do 1 things. Try to keep your node as simple as possible (in a logical way, don't do 1 function per Node, but a Node should do only 1 thing and publish a usefull result).

Remember : [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) [KISS](https://en.wikipedia.org/wiki/KISS_principle).


## Is that all ?

Not at all, the full ROS node documentation can be found here : [Nodes](http://wiki.ros.org/Nodes), you should really read it.

Also, you will learn later that a node can be much more than that (actually, 5 more things covered in this tutorial : nodelets, service client/server, action client/server), but this is enough at the moment.

# Quizz time !
(You will have one each chapter)


?[What do a Subscriber ?]
-[ ] It Publish messages
-[ ] It Advertise messages
-[ ] It Advertise topics
-[x] It receive messages
-[ ] It open a parameter server

?[What do a Publisher?]
-[x] It Publish messages
-[ ] It Advertise messages
-[x] It Advertise topics
-[ ] It receive messages
-[ ] It open a parameter server

?[Which of the following is NOT a valid topics name?]
-[ ] /topicsName
-[ ] very_long_topics_name_but_its_valid
-[ ] /1
-[x] 1
-[ ] ~1
-[ ] ~this_/one_/seem_/fishy_/n0_/or_/maybe_/n0t_

?[What is impossible in ROS ?]
-[x] Having an invalid topic name
-[ ] Coding 1 node for printing a message and republish it
-[ ] Having 2049 Nodes running at the same time
-[ ] Having 1 Publisher and 2048 Subscribers
-[ ] Having 2048 Publishers and 1 Subscriber
