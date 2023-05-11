.PHONY: all re clean fclean setHost

all: setHost
	mkdir -p ~/hde-camp/data/wordpress_app
	mkdir -p ~/hde-camp/data/wordpress_db
	docker-compose --file ./srcs/docker-compose.yaml --env-file ./srcs/.env up --build

re: clean all

clean: 
	docker-compose --file ./srcs/docker-compose.yaml --env-file ./srcs/.env down --rmi all --volumes

fclean: clean
	sudo rm -rfd ~/hde-camp/data/wordpress_db/* ~/hde-camp/data/wordpress_app/*
	sudo sed -i '/hde-camp/d' /etc/hosts
	sudo chmod 644 /etc/hosts

setHost:
	./srcs/tools/addHost.sh