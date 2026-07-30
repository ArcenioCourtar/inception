# User documentation
Three docker containers communicate over a docker network, with port 443 exposed to the host serving the website. The stack used is called a [LEMP](https://lempstack.com/) stack, which stand for Linux, Nginx, MySQL (through MariaDB) and PHP (through WordPress).

# Usage
a ```.env``` file is present in the ```srcs``` folder. Assign values to all empty fields to assign admins/users.
Once all values have been assigned run ```make```, this will create a directory called ```/home/acourtar/data``` which contains the permanent storage for the containers.  

```make down``` to stop containers.   
```make clean``` to stop containers, delete images and volumes.
See [Makefile](./Makefile) for more details.

Add this entry to your ```/etc/hosts``` file:
```sh
127.0.0.1 acourtar.42.fr
```
Visit the website through ```https://localhost:443```, or ```https://acourtar.42.fr```.

Your browser will warn you about a potential security risk due to the SSL certificate being self-signed. Just ignore the warning. :D

Access the administrator page by visiting ```https://localhost:443/wp-admin``` / ```https://acourtar.42.fr/wp-admin``` and logging in with the username and password specified in the .env file.

Run ```docker ps``` to see if the images are running correctly

# Services
## Linux
Linux is a kernel that many operating systems use to handle the hardware
abstractions of a given computer. I'm running them on a Debian distribution because I found it easier to work with than the alternative; Alpine. It's a larger distro with more features pre-installed, which leads to larger image/container sizes than if I were to use Alpine.
## Nginx
Pronounced "engine x" (doe the E in LEMP make sense now?), nginx is a webserver. This means that it listens to incoming traffic, and asks the other services to fulfill the requests it receives from the end user.  
## Mariadb
Mariadb is there to manage the SQL database that the website requires to
function. User information, comments and posts are stored here.
## Wordpress
Wordpress is essentially a toolbox for creating and managing websites. By
default it contains all of the infrastructure necessary to run a simple blogging
website. The default has been untouched. You'll be welcomed by a nice "Hello world!" landing page. :)
### PHP
Wordpress is written in PHP, a general-purpose scripting language.
