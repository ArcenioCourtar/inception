# Developer Documentation
Read the [USER_DOC.md](./USER_DOC.md) first, if you haven't yet.
# Other stuff
If you want to access the website by typing out the actual server name instead of ```https://localhost:443```, add this line to your ```/etc/hosts``` file:  
```127.0.0.1 acourtar.42.fr```

You're free to change the server name to something else if you so desire, just assign a different name to DOMAIN_NAME in [.env](./srcs/.env).  
All values will update accordingly (don't forget about ```/etc/hosts```).

Docker compose commands pertaining to building images and volumes, running the containers, and deleting images and volumes, are all described in the [Makefile](./Makefile).

You can change where the persistent volumes are stored by modifying the ```DB_DIR``` and ```WP_DIR``` in the Makefile. The [docker-compose.yml](./srcs/docker-compose.yml) uses these same variables defined in the Makefile. If you for some reason don't want to use make and run ```docker compose``` without it, you need to change the ```${DB_DIR}``` and ```${WP_DIR}``` in the docker-compose to a proper path instead of the variable.

# some useful commands
- ```docker ps``` | Display running containers
- ```docker image ls``` or ```docker images``` | list images
- ```docker volume ls``` | list volumes
- do not ask me why ```docker images``` is a thing but ```docker volumes``` is not
- ```docker exec -it [container_name] [command]``` | Run a command in a container in interactive mode. [command] is often times a shell like ```bash``` or ```sh```, but MariaDB has it's own shell which you can also run in interactive mode! Try it with ```docker exec -it mariadb mariadb -p``` (it will ask for the root password).
- ```docker logs [container_name]``` | display what the various containers printed on their stout and stderr. Since we're running the containers in detached mode we don't get to see them otherwise. Useful for debugging!
