<!--ts-->
- [Docker](#docker)
  - [Docker-compose](#docker-compose)
  - [Docker](#docker-1)
    - [Docker list all images](#docker-list-all-images)
    - [](#)
    - [Remove docker image which resides on your harddrive:](#remove-docker-image-which-resides-on-your-harddrive)
    - [Removing docker images and make sure all containers are down](#removing-docker-images-and-make-sure-all-containers-are-down)
    - [Search for images in docker hub](#search-for-images-in-docker-hub)
    - [Pull an image from docker hub](#pull-an-image-from-docker-hub)
    - [Print the IDs of all containers that have exited](#print-the-ids-of-all-containers-that-have-exited)
    - [Start container/s](#start-containers)
    - [Show which containers are running](#show-which-containers-are-running)
    - [Stop running containers](#stop-running-containers)
    - [Restart a container](#restart-a-container)
    - [Connect to a running container](#connect-to-a-running-container)
    - [Running a command in the contianer from outside](#running-a-command-in-the-contianer-from-outside)
    - [Start a container from an image and run a command in it](#start-a-container-from-an-image-and-run-a-command-in-it)
      - [Mount a directory in host into a docker container](#mount-a-directory-in-host-into-a-docker-container)
    - [Remove a container](#remove-a-container)
    - [Kill a container](#kill-a-container)
    - [Copying files from container to host and vice versa](#copying-files-from-container-to-host-and-vice-versa)
    - [Connecting to a service](#connecting-to-a-service)
  - [Inside a docker image](#inside-a-docker-image)
    - [Inspect the image](#inspect-the-image)
    - [Inspecting a Dockerfile](#inspecting-a-dockerfile)
    - [Build the image](#build-the-image)
  - [Copying files from container to host and vice versa](#copying-files-from-container-to-host-and-vice-versa-1)
  - [Mapping](#mapping)
    - [Mapping ports](#mapping-ports)
    - [Mapping volumes](#mapping-volumes)

<!-- Added by: gil_diy, at: Wed 21 Sep 2022 01:03:25 IDT -->

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

Docker images are stored in image registeries. The most commn registry is Docker Hub.

### Docker list all images

```bash
docker images
```
Attention: in the output the column `CREATED` is when the actual image was created and put on dockerhub


### 
```bash
docker stop <Container-id>
```


### Remove docker image which resides on your harddrive:

```bash
docker rmi -f <IMAGE ID>
```

-f = force

### Removing docker images and make sure all containers are down

First you should make sure the containers using this image are down, therefore:
```bash
docker rm $(docker ps --all -q)
docker rmi <IMAGE ID>
```

* The -q switch returns only the IDs

### Search for images in docker hub
```bash
docker search <image-name>
```

### Pull an image from docker hub
```bash
docker pull <image-name>
```
For example:

```bash
docker image pull alipne:latest
```

### Print the IDs of all containers that have exited

```bash
docker ps -q
```

```bash
docker ps --filter status=exited
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
docker stop <container-id>
```

### Restart a container
```bash
docker restart <container-id>
```

### Connect to a running container
```bash
docker attach <container-id>
```

### Running a command in the contianer from outside
```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

### Start a container from an image and run a command in it
```bash
docker run -i -t <docker-image:tag> sh
```

* -i, --interactive

* -t, --tty (which means terminal)

#### Mount a directory in host into a docker container


### Remove a container
```bash
docker rm <container-id>
```

### Kill a container
```bash
docker kill <container-name>
```

### Copying files from container to host and vice versa

From host to container:

```bash
docker cp ./my-file.txt de1193caf1f0:/var/www/html
```

From container to host:

```bash
docker cp de1193caf1f0:/var/www/html/my-file.txt ~/desktop
```

`de1193caf1f0` is the CONTAINER ID (**NOT** the image's name) retrieved from `docker ps`



### Connecting to a service
```bash
sudo docker-compose exec <service-name> sh
```

## Inside a docker image
A docker image is just a bunch of loosley connected read-only layers.

Docker takes care of stacking these layers and representingthem as a single **unified object**.

All Docker images start with a base layer, and as the changes are made and new content is added, new layers are added on top.


### Inspect the image

command to veify the configuration of the image. It will list all of the settings that were configured from the Dockerfile.
For example let's assume I have a docker image called elasticsearch labeled: 7.2.0

```bash
docker image inspect elasticsearch:7.2.0
```


### Inspecting a Dockerfile

Let's assume i'm in a directory `psweb`:

<p align="center" style="width:400px;" >
  <img src="images/docker/basic_fs.png" title="tool tip here">
</p>

This directory contains all the application source code, as well as subdirectories for views and unit tests.
Notice  that the repo has a filecalled **Dockerfile**. This is the file that
describes the application and tells Docker how to build it into an image.

Given a docker file
```bash
cat Dockerfile
```

The content's of the file:

```bash
FROM alipne
LABEL maintainer="gil@gmail.com"
RUN apk add --update nodejs nodejs-npm
COPY . /src
WORKDIR /src
RUN npm install
EXPOSE 8080
ENTRYPOINT ["node", "./app.js"]
```

**Explanation:**

1. Start with the alpine image

2. Add “gil@gmail.com” as the maintainer

3. Install Node.js as NPM

4. Copy in the application code

5. Set the working directory

6. Install dependecies

7. Document the app's network port

8. Set app.js as the default application to run

<p align="center" style="width:400px;" >
  <img src="images/docker/layers_example.png" title="tool tip here">
</p>

Now we will build the image.

### Build the image

The following command will build a new image called `web:latest`, The period (.) at the end of the command tells Docker to use the shell's current working directory as the **build context**.

Be sure to include the period (.) at the end of the command, and be sure to run the command from directory that contains the Dockerfile and the application code.

```bash
docker image build --tag web:latest .
```

**Tip:** Check that the image exists in your Docker host's local repository.

```bash
docker images
```

## Copying files from container to host and vice versa


```bash
docker cp ./my-file.txt de1193caf1f0:/var/www/html
```

`de1193caf1f0` is the CONTAINER ID (**NOT** the image's name) retrieved from `docker ps`


## Mapping

### Mapping ports
Map from local host to the container:

```bash
sudo docker run -p 8080:8080 -p 50000:50000 jenkins 
```

Means to map from port 8080 on local host to port 8080 in the container.
Always the **left number is the local host and the right number is the container**.

### Mapping volumes

```python
db_data:/var/lib/mysql
```

Another example:

```bash

```


Map the directory `db_data` in the host to the container in the path `/var/lib/mysql` .


