# CentOS-Docker-Container
This is my quick and custom Java on CentOS docker container. I expect to keep updating this container with more essentials like shell customisations, Linux utilities...etc.
## Building The Docker Image
```
$ docker build -t mycentos .
```

## Building & Running The Container
This is the quicker and preferred way. The Docker Compose file is used to maintain-as-code some context specific customisations like a preferred image name and bind mount (volume) mappings to specific directories. Mostly the customisations in `docker-compose.yml` file can be done using `docker build` command line 
options when building the image. However, the reason to prefer `docker-compose` is to codify these preferences.
```
$ docker-compose up
```

### Prerequisites
The container maps a container volume `sharedFolder` to the local directory `../SharedFolder`.

### Interactive (No-Exit)
The `docker-compose.yml` is setting the options `stdin_open` and `tty` to keep the container up and running.
This is required to keep the entry point of the CentOS container (`/bin/bash`) from exiting immediately.

## SSH into the Container
```
$ docker exec -it mycentos bash
``` 

## One liner to use this SSH-client-equipped container to SSH into a different host
```
$ function myssh() {
    docker container run --rm -it mycentos sshpass -p password ssh -o StrictHostKeyChecking=no user@${1}
}

$ myssh 10.50.30.27
```

Voila!
