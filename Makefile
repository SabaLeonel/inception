PATH=./srcs


all : up

create_vol:
	mkdir -p $(HOME)/data/mysql
	mkdir -p $(HOME)/data/html
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 777 $(HOME)/data


up : 
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

build :
	@docker-compose -f ./srcs/docker-compose.yml build

# remove:
# 	sudo chown -R $(USER) $(PATH)/data
# 	sudo chmod -R 777 $(PATH)/data
# 	rm -rf $(HOME)/data
# 	docker volume prune -f
# 	docker volume rm srcs_wordpress
# 	docker volume rm srcs_mariadb
# 	docker container prune -f

delete:
	cd srcs && docker-compose stop nginx
	cd srcs && docker-compose stop wordpress
	cd srcs && docker-compose stop mariadb
	docker system prune -a

re: remove delete build up

logs:
	cd srcs && docker-compose logs mariadb wordpress nginx