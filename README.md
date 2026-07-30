_This project has been created as part of the 42 curriculum by acourtar._

# Description
The second dive into sysadmin in the 42 curriculum. You're tasked with using docker-compose to set up a simple wordpress website.

The project was developed on a VM running Debian:Trixie, and all containers use Debian:Bookworm. Using SSH to work on the host computer's terminal instead of the VM's.

# Instructions
## requirements
[Docker](https://docs.docker.com/engine/install/), Root privileges and Make.
## Usage
Define user credentials in the .env file in /srcs. Run ```make```.  
Add this entry to your ```/etc/hosts``` file:
```sh
127.0.0.1 acourtar.42.fr
```
Visit the website through ```https://localhost:443```, or ```https://acourtar.42.fr```. Not adding this to your ```etc/hosts``` makes you unable to navigate beyond the landing page.

# Project Description
## Virtual Machines vs Docker containers
Both virtual machines and docker containers create isolated environments from the host machine, but docker containers are a lot smaller and more performant than VMs. compared to docker containers, VMs incur a way larger CPU and memory overhead for the host machine, longer startup time, and noticeably slower performance than the across the board. The host machine shares more of it's resources with the docker containers which allows for this difference

## Secrets vs Environment Variables
[Secrets](https://docs.docker.com/engine/swarm/secrets/) and environment variables solve the same problem; letting processes access protected resources like password protected databases and the like. The main difference is that secrets are encrypted whereas environment variables are often not, so they're less secure. This is not a live website, so utmost security is not the most necessary thing.

## Docker Network vs Host Network
When a docker network is set up, the containers within can only communicate with each other. They do not have access to the host unless a port is exposed to allow them to do so.

## Docker Volumes vs Bind Mounts
When you use a bind mount, a file or directory on the host machine is mounted from the host into a container. By contrast, when you use a volume, a new directory is created within Docker's storage directory on the host machine. Bind mounts are great if you want to share source code/builds between a host and container, or when you want to generate files in the container and persist them on the host. Volumes are easier to back-up and migrate, can moe easily used by multiple containers, and are also faster.

# Resources
[Dockerdocs manuals](https://docs.docker.com/manuals/)   
[Debian wiki](https://wiki.debian.org/)  
[nginx docs](https://nginx.org/en/docs/)  
[WordPress documentation](https://wordpress.org/documentation/)  
[MariaDB docs](https://mariadb.org/documentation/)  
[Linux man pages](https://linux.die.net/man/)  
[google.com](https://www.google.com/)  
Other codam students 

AI was used to troubleshoot connection issues at the tail end of the project.
