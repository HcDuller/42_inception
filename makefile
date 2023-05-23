.PHONY: all re clean fclean setHost prune

all: setHost
	mkdir -p ~/hde-camp/data/wordpress_app
	mkdir -p ~/hde-camp/data/wordpress_db
	mkdir -p ~/hde-camp/data/adminer
	mkdir -p ~/hde-camp/data/mongodb
	docker-compose --file ./srcs/docker-compose.yaml --env-file ./srcs/.env up

re: fclean all

clean: 
	docker-compose --file ./srcs/docker-compose.yaml --env-file ./srcs/.env down

fclean:
	docker-compose --file ./srcs/docker-compose.yaml --env-file ./srcs/.env down --rmi all --volumes
	sudo rm -rfd ~/hde-camp
	sudo sed -i '/hde-camp/d' /etc/hosts
	sudo chmod 644 /etc/hosts

setHost:
	./srcs/tools/addHost.sh

prune:
	docker system prune --all -f
	docker network prune