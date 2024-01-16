## What is periodic data?
* Data sent at fixed intervals
* Higher frequency than other patterns <br/>
  *- Usually 1 Hz or faster: 20Hz, 100Hz, 1000Hz*
* Latest value is the most important
  *- Better to receive newest value than to incur delays in repairing old data*
Eg. Sensor data

## Data Delivery(Relevant Qos)
Quality of Service
* **Reliablity** - Ensure data guarantees
  - *BEST_EFFORT*(no guarantee) is preferred
  - More deterministic and no additional overhead
  - Minimimzes resource usage(CPU/network bandwidth) 
  - Reduced jitter(variation) on reception period
  
* **Deadline** - Ensure compatibility of send rate versus expected receive rate
  Used to detect when expected data fails to arrive
  - **Digital Control Systems**
    * if single sensor values fails to arrive, then intrpolate older values to calculate best control
      - But must be notified that new value has arrived or has not arrived
  - **Detecting Application Failure**
    * Often an 'I m Alive' Topic used to periodically notify others of health and status
      - Deadline used to detect problems when failed to receive data
         * Usually after failure to receive N periodic data samples in a row
         * N > 1 to avoid false positive
         
* **Time-based Filter** - Only receive subsamples of a periodic data stream
  * Sometimes data published faster than needed 
    - E.g. HMI/GUI vehicle speed updated faster than need to changed on digital display
  * Useful to reduce network bandwidth usage
    - DDS will filter-out data in the publishing application when it can
    - Unwanted data not sent on network
  * However, DDS may need to filter on the reader-side if(any is true) 
    - The datatype is Keyed(common reason for reader-side filtering) 
    - Data is sent via Multicast 
    - DataWriter Liveliness.lease_duration not set to INFINITE
    - DataWriter is using PublisingMode.kind is ASYNCHRONOUS  


* **Transport Multicast** - Optimize network bandwidth for multiple subscribers of one stream
  * Sensed data is often used by many appplications in a system
    - Can greatly reduce network traffic when using multicast
  * However, default configuration of most networks 
    - Restricts multicast traffic to local subnet
    - Must configure router/VLAN to pass multicasts packets(for specific address) between subnets
    - Must set multicast TTL for Connext UDPv4 transport plugin
      * Default TTL is 1, same subnet
        - ParticipantQos.transport_builtin.udpv4.multicast_ttl(in XML)
        - dds.transport.UDPv4.builtin.multicast_ttl(Participant Property)
      

