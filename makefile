.PHONY: all re clean fclean

all:
	mkdir -p ~/data/wordpress_app
	mkdir -p ~/data/wordpress_db
	docker-compose --file ./srcs/docker-compose.yaml --env-file .env up --build

re: clean all

clean: 
	docker-compose --file ./srcs/docker-compose.yaml --env-file .env down --rmi all --volumes

fclean: clean
	sudo rm -rfd ~/data/wordpress_app/* ~/data/wordpress_app/*