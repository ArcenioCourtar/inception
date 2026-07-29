DB_DIR	= /home/acourtar/data/mariadb
WP_DIR	= /home/acourtar/data/wordpress

all: up

# Creates directories for the volumes, creates images if they're not created yet
# Sets up the containers, network and volumes
up:
	mkdir -p $(DB_DIR)
	mkdir -p $(WP_DIR)
	docker compose --project-directory srcs up -d --pull never

# Stops the containers (images and volumes are untouched)
down:
	docker compose --project-directory srcs down

# Deletes the images and the volumes
clean:
	docker compose --project-directory srcs down -v --rmi local

re: restart

# Restarts the containers (also builds if the images don't exist yet)
restart:
	$(MAKE) down
	$(MAKE) up

# Rebuilds the images and restarts containers
rebuild:
	docker compose --project-directory srcs down --rmi local
	$(MAKE) up
