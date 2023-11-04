<!--ts-->
   * [Docker](#docker)
      * [Docker commands](#docker-commands)
         * [Docker images](#docker-images)
            * [List all docker images:](#list-all-docker-images)
            * [List all docker dangling images:](#list-all-docker-dangling-images)
            * [Remove dangling images](#remove-dangling-images)
            * [Remove images according to a pattern](#remove-images-according-to-a-pattern)
         * [Containers](#containers)
            * [List containers](#list-containers)
            * [Remove container](#remove-container)
      * [Docker-Compose](#docker-compose)
         * [pull/create and start container](#pullcreate-and-start-container)
         * [Bring down the app](#bring-down-the-app)
         * [Get which apps are running](#get-which-apps-are-running)
         * [list all services](#list-all-services)
         * [View logs](#view-logs)
         * [Creating block diagrams from docker-compose.yml](#creating-block-diagrams-from-docker-composeyml)

<!-- Added by: gil_diy, at: Sat 05 Mar 2022 10:33:12 IST -->

<!--te-->

# Docker


## Docker commands

### Docker images

#### List all docker images:
```bash
docker images -a
```

#### List all docker dangling images:

Docker images consist of multiple layers. **Dangling images** are layers that have no relationship to any tagged images. They no longer serve a purpose and consume disk space

```bash
docker images -f dangling=true
```

#### Remove dangling images

```bash
docker rmi Image Image
```

#### Remove images according to a pattern
```bash
docker images -a | grep "pattern" | awk '{print $3}' | xargs docker rmi
```
### Containers

#### List containers
```bash
docker ps -a
```

#### Remove container
```bash
docker rm <ID_or_NAME>
```


## Docker-Compose

Docker Compose is a tool for defining and running multi-container Docker applications.It uses YAML files to configure the application's services and performs the creation and start-up process of all the containers with a single command. The docker-compose CLI utility allows users to run commands on multiple containers at once, for example, building images, scaling containers, running containers that were stopped, and more.

The docker-compose.yml file is used to define an application's services and includes various configuration options. For example, the build option defines configuration options such as the Dockerfile path, the command option allows one to override default Docker commands, and more



### pull/create and start container
Create and start containers, if the containers are not reside locally the images will be pulled from the web:
```bash
docker compose up
```

### Bring down the app
Bring down the app
```bash
docker compose down
```

### Get which apps are running

To see the status of each container and the actual ports:
```bash
docker compose ps
```

###  list all services
```bash
docker compose config --services
```
###  View logs

To view logs (from a node app), just run:
```bash
docker compose logs -f <service-name>
```

### Creating block diagrams from docker-compose.yml

[Link](https://medium.com/@krishnakummar/creating-block-diagrams-from-your-docker-compose-yml-da9d5a2450b4)
