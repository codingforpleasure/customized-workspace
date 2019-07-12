<!--ts-->
      * [Docker-compose](#docker-compose)
      * [Docker](#docker)
         * [Docker list all images](#docker-list-all-images)
         * [Search for images in docker hub](#search-for-images-in-docker-hub)
         * [Pull an image from docker hub](#pull-an-image-from-docker-hub)
         * [Start container/s](#start-containers)
         * [Show which containers are running](#show-which-containers-are-running)
         * [Stop running containers](#stop-running-containers)
         * [Restart a container](#restart-a-container)
         * [Run a command in a container](#run-a-command-in-a-container)
         * [Kill a container](#kill-a-container)

<!-- Added by: gil_diy, at: 2019-07-12T23:01+03:00 -->

<!--te-->

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

### Search for images in docker hub
```bash
docker search <image-name>
```

### Pull an image from docker hub
```bash
docker docker <image-name>
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


### Run a command in a container
```bash
docker run -it <docker-image:tag> sh
```
### Kill a container
```bash
docker kill <container-name>
```
