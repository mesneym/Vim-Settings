# Nodelets
Nodelets allows sharing of memory pointer instead the actual data. This is useful in cases where large data is needed to published over ros.
Nodelets are like wrappers for ros nodes. 

## Components
* Pluginlib - plugin libraries loaded at runtime in ros
* Nodelet Manager - Nodelets are simply plugins which are loaded during runtime by ros node which is being run. These nodelets can subscribe and publish topics like 
  normal nodes by which they are loaded. Only differene being that if the topic is published and subscribed inside the same nodelet manager, then only the memory address 
  is passed
 
                
### Example 
Create a nodelet class
 
```cpp
namespace sample_nodelet_ns  
{
  class sample_nodeletClass:public nodelet:Nodelet
  {
    public:  
      sampleNodeletClass();
      ~sampleNodeletClass();
      
      virtual void onInit() 
  }
}
```

## Nodelet class uses a virtual function onInit() which is used for initializing your nodelet by initializing the nodelet baseclass that you inherit from nodelet::Nodelet
```
virtual void onInit()
{
  nh = getNodeHandle();
  private_nh
}

```

* CMakeList.txt dependencies
* Package.xml and nodelet_plugins.xml dependencies
* Launch file 


