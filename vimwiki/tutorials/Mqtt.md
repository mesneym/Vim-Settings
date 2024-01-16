# Mqtt Review
* Layer 7 of OSI
* Runs on top of TCP/IP
* Works on publisher and subscriber model
* Messages are published via Broker
* Broker can be **local** or **Internet**

# Why MQTT
* Mainly used for Constrained devices with limited bandwidth
* Uses less battery power to publish and subscribe data
* Connection is secured using TLs where traffic is encrypted on the Web
* Can be used in wide range of Iot applications

# MQTT over Websockets (full duplex over single TCP/IP connection) vs MQTT
Mqtt is normally used with websockets for webpages(Webpage may act as publisher or subscriber). 
Analogy | delivery service is MQTT and roads/paths are websockets
        
MQTT over websocket                                    MQTT
   MQTT Data                                       MQTT Data
      ||                                                ||  
   Websocket envelope                              TCP/IP envelope
      ||
   TCP/ IP envelope 
   


# Clean Session, Persistence, Retained messages
https://pagefault.blog/2020/02/05/how-to-set-up-persistent-storage-for-mosquitto-mqtt-broker/#:~:text=By%20default%20the%20number%20of,the%20size%20is%20not%20limited
