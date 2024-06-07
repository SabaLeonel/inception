include ./srcs/.env

PATH := ./srcs
DOCKER_COMPOSE := /docker-compose.yml
PROJECT_NAME := Inception

WORDPRESS_VOL := $(VOLUME_PATH)/wordpress
MARIADB_VOL := $(VOLUME_PATH)/mariadb

DOCKER_COMPOSE_CMD := docker compose -f $(PATH)$(DOCKER_COMPOSE) -p $(PROJECT_NAME)

all : create_vol build

create_vol:
	@echo "Creating the volumes for the database and the web server"
	mkdir -p $(VOLUME_PATH)/database
	mkdir -p $(VOLUME_PATH)/web

delete_vol:
	@echo "Deleting the volumes for the database and the web server"
	rm -rf $(VOLUME_PATH)/database
	rm -rf $(VOLUME_PATH)/web

up:
	@echo "Starting the containers"
    $(DOCKER_COMPOSE_CMD) up

build: 
	$(DOCKER_COMPOSE_CMD) up --build

start:
	$(DOCKER_COMPOSE_CMD) start

stop: 
	$(DOCKER_COMPOSE_CMD) stop

up:
    $(DOCKER_COMPOSE_CMD) up

down down_vol:
	$(DOCKER_COMPOSE_CMD) $@

erase:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null

purge:
	docker system prune -f

fclean: erase purge

start: up