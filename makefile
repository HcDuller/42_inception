.PHONY: all re clean fclean setHost

all: setHost
	mkdir -p ~/data/wordpress_app
	mkdir -p ~/data/wordpress_db
	docker-compose --file ./srcs/docker-compose.yaml --env-file .env up --build

re: clean all

clean: 
	docker-compose --file ./srcs/docker-compose.yaml --env-file .env down --rmi all --volumes

fclean: clean
	sudo rm -rfd ~/data/wordpress_db/* ~/data/wordpress_app/*
	sudo sed -i '/hde-camp/d' /etc/hosts
	sudo chmod 644 /etc/hosts

setHost:
	./srcs/tools/addHost.sh