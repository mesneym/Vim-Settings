## What is Docker
Docker provides the ability to package an application with all the dependencies needed to run
the application.


### Image vs Containers
        *image                   container*
  actual package          Starts the application
  not running             running
  
  
### Docker vs Vm
     *Docker                                 vm*
virtualizes the application layer  virtualizes complete operating system(both kernel and application layer)
smaller and faster(mb)             muchi


### Docker Commands
* docker ps* -> all running containers
  - *docker ps -a* -> more useful info on docker(when docker started or stopped) 
* *docker pull "image"* 
* *docker run "image"*
  - *docker run -d "image"* -> run in detached mode
* *docker stop "containerID"*
* *docker start "ContainerID"*


### Container port vs Host port
Host machine can talk to container port by binding ports
Can bind multiple host port to same container port and not vice versa
*docker -p hostport:dockerport image* 



### Debugging Docker
* *docker logs "container id"*
   - docker logs -f | stream the logs
* *docker run --name "name of docker" "image"*
* *docker exec -it(interactive terminal) "ContainerID" /bin/bash*


### Docker Network
Docker in same network can communicate just using the container name
Any external app outside network must use port:ip etc

*docker network ls* ->check for network list
*docker network create "network name"*
*docker run --net "network name" "image"*

### Running Multiple Docker Containers
Uses a yaml file
*docker-compose -f yaml.yaml up* ->start docker 
*docker-compose -f yaml.yaml down* ->stop docker 

Example
```
docker run -d\
--name mongodb\
-p 27017:27017\
-e MONGO-INITDB_ROOT_USERNAME=admin \
-e MONGO-INITDB_ROOT_PASSWORD=password \
--net mongo-network \ 
mongo


docker run -d\
--name mongo-express \
-p 8080:8080 \
-e ME_CONFIG_ADMIN=admin
-net mongo-network \ 
mongo-express
```

Corresponding yaml file

```
version:'3'
services:
  mongodb:
    image:mongo
    ports:
      -27017:27017 = HOST:CONTAINER
    environment:
      MONGO.._USERNAME=admin
  
  mongoexpress:
    image:mongo-express
    ports:8080:8080
    environment:
      ME_CONFIG_ADMIN=admin
```
*NB docker compose takes care of creating a common network*

### Building Docker Image
create *Dockerfile*
```
From "Base_Image"
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=[password](password.md)
RUN mkdir -p /home/app
COPY . /home/app
CMD ["node","/home/app/server.js"]
```
*docker build -t my-app:1.0 .*  to build docker
*docker rmi "imageid"*


### Docker Volume
Data persistence

Data get automatically replicated from host to docker and vice versa

*Types of Volume* 
*Host Volume* --docker run -v host_directory/container_directory | (you decide where on the host system the reference is made)
*Anonymous Volume* -- docker -v container_directory     ( for each container a folder is generated in the host that gets mounted. Normally /var/lib/docker/volumes/random_hash/_data)
*Named Volume* --  -v name:containerdirectory (similar to anonymous volume, you can reference volume by name)










