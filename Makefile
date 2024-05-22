all:
	docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker compose -f srcs/docker-compose.yml up -d --build --force-recreate


clean:
	-docker stop $(docker ps -qa)
	-docker rm $(docker ps -qa)
	-docker rmi -f $(docker images -qa)
	-docker volume rm $(docker volume ls -q) 2 >/dev/null

.PHONY: all re down clean