## DNS 
* Why Using public DNS 8.8.8.8? 

*In /etc/resolv.conf*
```
namesever 8.8.8.8 
```
tells it to use google public dns


**DNS**
computer(webpage) -> resolver(isp)                     -> root server()
                                                       <- returns TLD ip address
                                                       -> send request to TLD server()
                                                       <- gets autoritative name server ip
                                                       -> send request to Autoritative Name server()
                                                       <- gets ip address 
                     (store ip address in cache memory)
                     
**Root Server**
* 13 sets startegically placed around world
* operated by 12 different organizations
* each set has their own unique ip

**TLD Server**
[stores](stores.md) the address information for top level domains. such as .com, .net, .org etc

**Autoritative Server**
Responsible for knowing everything about the domain including the ip address


## SSL, TLS, HTTPS 
SSL 
* Uses public encryption to secure data
1. computer tries to connect to website using ssl
2. webrowser asks website to identify itself
3. website sends a copy of its certificate(id)
4. webrowser checks certificate to see if website valid
5. webroswer sends an acknowledgement to webserver
6. webserver responds with an acknowlegement. A session is then created to allow for communication

TLS
successor to ssl, much more secure.  


## Network switch





