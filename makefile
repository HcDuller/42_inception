NGINX_NAME = nginx1.0
NGINX_IMAGE = nginx:1.0
WORDPRESS_NAME = wordpress1.0
WORDPRESS_IMAGE = wordpress:1.0

pwd = $(shell pwd)
#--mount type=bind,source="$(pwd)"/worpress_data,destination=/data/www

#-v $(PWD)/worpress_data:/data/www

.PHONY: ship_nginx build_nginx remove_nginx_container remove_nginx_image clean_nginx build_run_nginx re_nginx remove_nginx_sh

build_run_nginx: build_nginx ship_nginx

re_nginx: clean_nginx build_run_nginx

build_nginx:
	docker build --tag=$(NGINX_IMAGE) ./nginx
ship_nginx:
	docker run -d \
	--name $(NGINX_NAME) \
	--mount type=bind,source=$(pwd)/wordpress_data,destination=/data/www \
	-p80:80 \
	$(NGINX_IMAGE)
clean_nginx: remove_nginx_container remove_nginx_image

remove_nginx_sh:
	./nginx_cleanup.sh $(NGINX_NAME) nginx

remove_nginx_container:
	docker stop $(NGINX_NAME)
	docker rm $(NGINX_NAME)
remove_nginx_image:
	docker rmi $(NGINX_IMAGE)

###############################################
build_wordpress:
	docker build --tag=$(WORDPRESS_IMAGE) ./wordPress_php_fpm
ship_wordpress:
	docker run -d -ti \
	-p80:80 \
	--name $(WORDPRESS_NAME) \
	--mount type=bind,source=$(pwd)/wordpress_data,destination=/data/www \
	$(WORDPRESS_IMAGE)
#docker-compose -f ./docker-compose.yaml down
#docker-compose up -d --build