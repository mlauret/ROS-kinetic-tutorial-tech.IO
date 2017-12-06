# Nodes

In a typical ROS application, only 2 things exists : 

- The roscore
- Nodes

Nodes can also be nodelets, but it's a special kind of node described later. And also, roscore is just the name of the executable who start a `rosmaster`, a `parameter server` and the `rosout` logging system. But for simplicity, we will just call it roscore.

The roscore is the postman, it's in charge of delivering the correct message to the correct recipient. The node can be the expediter or the recipient, or both, very often both.

So, just like in a post system, nodes need to tell the roscore : "Hey i'm here, I need this", or "Hey, I want to send this !"

We call this a `Subscriber` (who `subscribe`) and a `Publisher` (who `advertise` and `publish`). 

A Subscriber will ask the roscore to send to it all messages of a certain `type` and on a certain `topic`. example : 
- Node :  I'm the node **"super_subscriber"**.
- Node :  I need all message of type **"std_msgs/String"**.
- Node :  Who come from the topic **"/chatter"**.
- roscore : Ok!
 
Later...

- roscore : There is a message !
- Node : Thanks you bro, I received it.

In ROS, here how we call this  :
- Node : Initialize and register the node name **"super_subscriber"** on roscore.
- Node : Subscribe to the topic **"/chatter"** with the message type **"std_msgs/String"**.

Later... 

- roscore : A message of type **"std_msgs/String"** on the topic **"/chatter"** was published.
- Node : Received the message.


A Publisher will need to register himself as a publisher and publish the message. example : 
- Node : I'm the node **"cool_publisher"**.
- Node : I will send message of type **"std_msgs/String"** on the topic **"/chatter"**
- roscore : Ok, I keep me in touch when you send a message.

Later...

- Node : I want to send the message **"Hello"**.
- roscore : Ok, message send.

Again, in ROS tongue : 
- Node : Initialize and register the node name **"cool_publisher"** on roscore.
- Node : Create a publisher **"pub"** and Advertise on the topic **"/chatter"** with the message type **"std_msgs/String"**
- roscore : Ok, no error.

Later...

- Node : Build the message **"msg"** who contain : **"data: Hello"** and send it trought **"pub"**
- roscore : Ok, no error.

## About this topic things

A topic is just a channel where message go through, a way for the roscore to know who send what and how.

A topic consist of : 

1. A `topic name`
2. A `topic type` (message type)
3. `publishers`
4. `subscribers`

On the previous example, we have : 

1. The `topic name` **"/chatter"**
2. The `topic type` **"std_msgs/String"**
3. The `publisher` **"cool_publisher"**
4. The `subscriber` **"super_subscriber"**

Just remember, topics can have multiple subscriber/publisher.

And also topic are all on the form : **/something/something_else/blah** or **~something_else/blah** or **something_else/blah**.
They all begin with a **letter**, a **/** or a **~**

- if a topic name begin with a **letter**, the topic name will be **relative**
- if a topic name begin with a **/**, the topic name will be **absolute**
- if a topic name begin with a **~**, the topic name will be **private**



## Is that all ?

You will learn later that a node can be much more than that (actually, 5 more things covered in this tutorial : nodelets, service client/server, action client/server), but this is enough at the moment. 

# Quizz time !
