
## Namspace
| Node      | Relative(default)    | Global             | Private                     |
|-----------|----------------------|--------------------|-----------------------------|
| /node1    | bar->/bar            | /bar->/bar         | ~bar->/node1/bar            |
| /wg/node2 | bar->/wg/bar         | /bar->/bar         | ~bar->/wg/node2/bar         |
| /wg/node3 | foo/bar->/wg/foo/bar | /foo/bar->/foo/bar | ~foo/bar->/wg/node3/foo/bar |
##### References
http://wiki.ros.org/Names



## Ros-Remapping
Remapping allows you to "trick" a ROS node so that when it thinks it is subscribing to or
publishing to /some_topic it is actually subscribing to or publishing to /some_other_topic, for instance. 

```
<remap from="/different_topic" to="/needed_topic"/>
```
##### References
http://wiki.ros.org/roslaunch/XML/remap



## ROS Callbacks and Spinners  
**Spinner** - A spinner is an object that has the ability to call the callbacks contained in a callback queue.
A callback queue is the object in which each subscriber will add an element each time a message is received by resolving which kind

**CallbackQueue** - A callback queue is the object in which each subscriber will add an element each time a message is received by resolving which kind 

* **Single thread spinner** - the default one, takes the messages contained in a callback queue and process 
    the callbacks one by one while blocking the execution of the thread that called it.
* **Multi-threaded spinner**- spawns a couple of threads (configurable) that will execute callbacks in parallel 
    when messages are received but blocks the execution of the thread that called it.
* **Asynchronous spinner**: spawns a couple of threads (configurable) that will execute callbacks in parallel while not blocking the thread that called it. The start/stop method allows to control when the callbacks start being processed and when it should stop.

These objects may be instantiated manually in advanced ROS nodes but to avoid verbose initialization, an alternative, object-less, 
API is provided through functions in the ROS namespace. Aka ros::spin(), ros::spinOnce() and so on. 
This API rely on a default callback queue implemented as a singleton which is accessible through the ros::getGlobalCallbackQueue() function.
So basically when you call the ros::spinOnce() function, a single-thread spinner is created and its spin method is called once using 
the default callback queue (see init.cpp from roscpp).
And to finish, when you create a Subscriber, you pass it a NodeHandle and each NodeHandle has an associated 
callbackqueue that default to the global one but which can be overridden using the getCallbackQueue/setCallbackQueue methods.

##### References
* [roswiki spinning](http://wiki.ros.org/roscpp/Overview/Callbacks%20and%20Spinning) 
* [Ros Spinning Explanation](https://levelup.gitconnected.com/ros-spinning-threading-queuing-aac9c0a793f)



