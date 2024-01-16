
 
#  Data Distribution Services

## Data Centricity
An architecture that focuses on describing the(part of the) world(you care about) as it is(at a certain point in time)

implication
State of the world can be maintained by infrasture, not each app

## Non data centricity
aka message-centricity
implication
State must be inferred, reconstructed, managed by each app


## Why is it better to just describe the world
* Reconstruction the state of the world is hard
   * Must infer based on all previous messages
   *  Maintaining all these messages is expensive
   * Each app makes these inferences => duplicate effort

* People make mistakes
  * Man copies of state => may be different => bugs
  * Uniform operations on state => fewer bugs
   
Integrate based on what to do
  => must know everything you might do =>future extension hard

Integrate based on what exists
  => do whatever you like; no one else cares 
  => future extension easy
  

## Integration effor doesn't scale
* Integrate at level of function
  => everything integrates with everything else
  => effort scales with square of number of apps

* Integrate with common model
  => effort scales with number of apps


A data-centric architecture
is based on a data model that is:
  * Appropriately documented
    ie understandable by humans
  * Formally defined
    ie. understandable by machines
  * Discoveralble 
    ie. can be found during execution


The data model is independent of any domain-specific funtionality/ application
 * i.e made of nouns, not verbs

The data model is the only authoritative source of state in the system



DDS: observe & respond to a changing world
Other technologies that support data-centricity:
  * Databases: sql
  * Web: HTTP
* assume the world changes slowly  
* use network resources inefficiently
* are highly centralized

                    100apps => 100x load

app -----          (a few updates/sec)app
app ----- server   ------------------ app
app ----                              app
         (centralized)


DDS:
  * allows you to observe frequent changes
  * uses network resources efficiently 
  * is decentralized 
  
  load inedep # apps
   
 
 
# Terminology and concepts 
* Domain: world you're talking about
* Topic: group similar things(what how when)
  * similar structure ("type") 
  * similar what the change over time("qos")
* Instance: individual(changing) thing
* Sample: snapshot of an instance at a point in time
* DataWriter: source of information about part world(topic)
* DataReader: observer of part of the world(topic)



Evolution of networking
PTP
tcp sockets

client/server
mqtt,xmpp,opc,corba

publish/subscribe
can bus, some/ip, zeroMQ, JMS

Queueing
nats.io, amqp, active mq


# Topic data types

