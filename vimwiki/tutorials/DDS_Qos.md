# Qos Overview
Standard Implementation for Qos policies is 25
* Each dds entity has own set of Qos Policies <br/>
    *-DomainParticipant, Publisher, Subscriber, DataWriter, DataReader, Topic*
* Different Entities can be configured to behave differently 


Example of Qos policies
| Category            | Descprition                                                                           | QosPolicy                          |
|---------------------|---------------------------------------------------------------------------------------|------------------------------------|
| End-to-End Behavior | Affects how DDs delivers data from Writers to Readers                                 | Reliablity, Time-Based Filter      |
| Data Durability     | Configures how much and how long data should be made available to future Readers      | History,Durability,Lifespan        |
| Fault Tolerance     | Detecting failure in communication and controlling failover between redundant Writers | Ownership, liveliness, Deadline    |
| Discovery           | Configures startup process for new participants to discover other participants        | Discovery, Discovery config        |
| Infrastructure      | Manage memory usage and underlying physical network                                   | Resource Limits, Transport Builtin |

## Qos Compatibility
* Local  - Policies that affect local behavior
  - These policies can be independently set between apps
  - Resource allocation: buffer sizes, thread settings
  - Infrasture: transport configuration
   
* End-to-End  - Policies affecting End-to-End behavior need to be compatible between publishing and subscribing apps
  - Requested vs Offered (RxO) - contract sets compatibility requirements
  - RxO Qos Policies must be compatible for initial connection of Writers to Readers as well as for continuous data delivery

## Requested vs  Offered(RxO)
* For RxO Qos Policies
   - Publishing applications OFFER a "level of service" for a Qos Policy
   - subscribing applications REQUEST a "level of service"
* OFFERED level must **meet or exceed** REQUESTED level 
  - Example, Reader request data at 10Hz, Writer must offer to send data at >= 10Hz
  - Writer offers to send data RELIABLY, Reader can request to receive data RELIABLY or with BEST EFFORT
     * *RELIABLE level of service > BEST EFFORT level of service*
* Only 9 out of 25 standard Qos Policies have RxO contracts
  - DataRepresentation  
  - Deadline*
  - DestinantionOrder
  - Durability
  - LatencyBudget
  - Ownership
  - Liveliness*
  - Presentation
  - Reliability
   
\* are continuously monitored after connection 
 
## Communication Patterns
[Periodic_Data](Periodic_Data.md) 



## XML for Qos 
[DDS_XML](DDS_XML.md)
