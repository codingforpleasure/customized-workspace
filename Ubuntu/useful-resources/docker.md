<!--ts-->
   * [Docker](#docker)
      * [Docker-compose](#docker-compose)
      * [Docker](#docker-1)
         * [Docker list all images](#docker-list-all-images)
         * [Remove docker image which resides on your harddrive:](#remove-docker-image-which-resides-on-your-harddrive)
         * [Search for images in docker hub](#search-for-images-in-docker-hub)
         * [Pull an image from docker hub](#pull-an-image-from-docker-hub)
         * [Start container/s](#start-containers)
         * [Show which containers are running](#show-which-containers-are-running)
         * [Stop running containers](#stop-running-containers)
         * [Restart a container](#restart-a-container)
         * [Connect to a running container](#connect-to-a-running-container)
         * [Run a command in a container](#run-a-command-in-a-container)
            * [Mount a directory in host into a docker container](#mount-a-directory-in-host-into-a-docker-container)
         * [Remove a container](#remove-a-container)
         * [Kill a container](#kill-a-container)
         * [Copy files into a docker machine from a local host](#copy-files-into-a-docker-machine-from-a-local-host)
         * [Conencting to a service](#conencting-to-a-service)
         * [Build the image](#build-the-image)
         * [Inspect the image](#inspect-the-image)

<!-- Added by: gil_diy, at: 2019-11-30T15:38+02:00 -->

<!--te-->

# Docker

docker images resides in the following path:
```bash
 /var/lib/docker
 ```


 Solving Docker permission denied while trying to connect to the Docker daemon socket
```bash
    sudo usermod -a -G docker $USER
```

## Docker-compose

Let's rebuild our app now that we've made changes, using:
```bash
docker-compose build
```

Start the application stack as a background daemon process:
```bash
docker-compose up -d
```


A shortcut command to rebuild our Node.js app and update the running container.
```bash
docker-compose up -d --build
```
(This is a shortcut for running `docker-compose build` and `docker-compose up -d`)



To view live logs from :
```bash
docker-compose logs -f api
```



## Docker

### Docker list all images

```bash
docker images
```
Attention: in the output the column `CREATED` is when the actual image was created and put on dockerhub


### Remove docker image which resides on your harddrive:

```bash
docker rmi <IMAGE ID>
```

### Search for images in docker hub
```bash
docker search <image-name>
```

### Pull an image from docker hub
```bash
docker pull <image-name>
```

### Start container/s

```bash
docker start <container-name>
```


### Show which containers are running

```bash
docker ps -a
```

### Stop running containers
```bash
docker stop <container-name>
```

### Restart a container
```bash
docker restart <container-id>
```

### Connect to a running container
```bash
docker attach <container-id>
```

### Run a command in a container
```bash
docker run -it <docker-image:tag> sh
```
#### Mount a directory in host into a docker container


### Remove a container
```bash
docker rm <container-name>
```

### Kill a container
```bash
docker kill <container-name>
```

### Copy files into a docker machine from a local host
```bash
docker cp
```

### Conencting to a service
```bash
sudo docker-compose exec <service-name> sh
```
### Build the image

```bash
docker image build -t <name>:latest .
```

Be sure to include the period (.) at the end of the command, and be sure to run the command from the directory that contains the Dockerfile and application code.

### Inspect the image

commd to veify the configuration of the image. It will  list all of the settings that were configured from the Dockerfile.
```bash
docker image inspect web:latest
```
