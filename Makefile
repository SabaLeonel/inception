# Makefile for docker-compose

# all commands

# create and start containers
all: up

# stop and remove containers, networks, images, and volumes
up:
	@docker-compose up -d

# stop and remove containers, networks, images, and volumes
down:
	@docker-compose down

# start containers
start:
	@docker-compose start

# stop containers
stop:
	@docker-compose stop

# restart containers
restart:
	@docker-compose restart

# Build images
build:
	@docker-compose build

# View output from containers
logs:
	@docker-compose logs -f

# List containers
ps:
	@docker-compose ps

# Run a command in a running container
exec:
	@docker-compose exec app bash

# pull images from a registry
pull:
	@docker-compose pull

# push images to a registry
push:
	@docker-compose push

status:
	@docker ps