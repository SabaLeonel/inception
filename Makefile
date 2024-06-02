include ./srcs/.env

PATH= ./srcs

DOCKER_COMPOSE_BUILD := docker compose -f ./srcs/docker-compose.yml -p inception up --build



all : create_vol build

create_vol:
	@echo "Creating the volumes for the database and the web server"
	mkdir -p $(VOLUME_PATH)/database
	mkdir -p $(VOLUME_PATH)/web

delete_vol:
	@echo "Deleting the volumes for the database and the web server"
	rm -rf $(VOLUME_PATH)/database
	rm -rf $(VOLUME_PATH)/web

build : 
	$(DOCKER_COMPOSE_BUILD)

down : 
	docker compose -f ./srcs/docker-compose.yml -p inception down

stop : 
	docker compose -f ./srcs/docker-compose.yml -p inception stop

start : 
	docker compose -f ./srcs/docker-compose.yml -p inception start

erase: 
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null

purge:
	docker system prune -f

fclean: erase purge

logs:
	cd srcs && docker-compose logs mariadb wordpress nginx

.PHONY: all create_vol delete_vol build down stop start erase purge fclean logs