## ROS2 communication with DDS
Setup DDS publisher/subscriber with ROS
### Setting UP DDS
* create an idl message for dds 
  ```
  fastddgen -example CMake setup.idl
  ```
* Due to Name mangling issues
```
In constructor of SetupPubSubTypes.cxx 
Change
   setName("idl_msgs::idl::Setup_"); 
To 
   setName("idl_msgs::idl::dds_::Setup_"); 

 And Prefix topic name with rt
    topic_ = participant_->create_topic(
        "rt/setup",
        type_.get_type_name(),
        TOPIC_QOS_DEFAULT);
    if (topic_ == nullptr)
``` 

### Setting UP ROS
* Create a package to use idl files.Note package name must match with module name
  For example
  ```cpp
  setup.idl
  
  module idl  
  {
    module autoarm
    {
      struct Setup
      {
        string req  
      }
    }
  }
  ```
  
  Then the equivalent package structure has to be
  ```
    idl\
       autoarm\
            setup.idl
       cmakelist.txt     
       package.xml
  ```
     
     
* Create another package ros subscriber to listen to messages 



