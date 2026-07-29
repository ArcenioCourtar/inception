# Developer Documentation
Read the [USER_DOC.md](./USER_DOC.md) first, if you haven't yet.

# Other stuff
If you want to access the website by typing out the actual server name instead of ```https://localhost:443```, add this line to your ```/etc/hosts``` file:  
```127.0.0.1 acourtar.42.fr```

You're free to change the server name to something else if you so desire, just assign a different name to DOMAIN_NAME in [.env](./srcs/.env).  
All values will update accordingly (don't forget about ```/etc/hosts```).

Docker compose commands pertaining to building images and volumes, running the containers, and deleting images and volumes, are all described in the [Makefile](./Makefile).

You can change where the persistent volumes are stored by modifying. GIMME A SEC I NEED TO UPDATE SOMETHING
