<!--ts-->
<!--te-->

docker images resides in the following path:
```bash
 /var/lib/docker
 ```


 Solving Docker permission denied while trying to connect to the Docker daemon socket
```bash
    sudo usermod -a -G docker $USER
```

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
