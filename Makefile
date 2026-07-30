DB_DIR	= /home/acourtar/data/mariadb
WP_DIR	= /home/acourtar/data/wordpress

all: up

# Creates directories for the volumes, creates images if they're not created yet
# Sets up the containers, network and volumes
up:
	mkdir -p $(DB_DIR)
	mkdir -p $(WP_DIR)
	DB_DIR=$(DB_DIR) WP_DIR=$(WP_DIR) docker compose --project-directory srcs up -d --pull never

# Stops the containers (images and volumes are untouched)
down:
	DB_DIR=$(DB_DIR) WP_DIR=$(WP_DIR) docker compose --project-directory srcs down

# Deletes the images and the volumes
# Because this setup stores the files on your host machine, not just in the Docker volumes
# calling the command to delete the volumes will remove them for the volume list,
# but the data will persist on your machine. Therefore a proper "clean" involves
# getting rid of the directories as well.
clean:
	DB_DIR=$(DB_DIR) WP_DIR=$(WP_DIR) docker compose --project-directory srcs down -v --rmi local
	sudo rm -rf $(DB_DIR) $(WP_DIR)

re: restart

# Restarts the containers (also builds if the images don't exist yet)
restart:
	$(MAKE) down
	$(MAKE) up

# Rebuilds the images and restarts containers
rebuild:
	DB_DIR=$(DB_DIR) WP_DIR=$(WP_DIR) docker compose --project-directory srcs down --rmi local
	$(MAKE) up
