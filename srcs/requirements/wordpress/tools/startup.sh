#!/bin/sh

if wp config path --path=/data/www/wordpress >/dev/null 2>&1; then
  echo "Wordpress already configured."
else
  wp config create --dbname="$DBNAME" --dbuser="$DBUSER" --dbpass="$DBPSW" --dbhost=mariadb --path=/data/www/wordpress
fi

if wp db check --path=/data/www/wordpress >/dev/null 2>&1; then
  echo "Database already created."
else
  wp db create --path=/data/www/wordpress
fi

if wp core is-installed --path=/data/www/wordpress >/dev/null 2>&1; then
  echo "Already Installed."
else
  wp core install --path=/data/www/wordpress --url=hde-camp.42.fr --title="hde-inception" --admin_user="$WPADM" --admin_password="$WPADMPSW" --admin_email=sUser@fake.org
  wp user create --path=/data/www/wordpress "$WPUSR" "evaluator@fake.org" --role=editor --user_pass="$WPUSRPSW" --display_name="42Evaluator" --user_nicename="Nice_Eval" --nickname="Eval_Guy"
fi
# Bonus Start

if wp plugin is-installed redis-cache --path=/data/www/wordpress;then
  echo "Redis already Installed."
else
  echo "Installing Redis."
  wp plugin install redis-cache --path=/data/www/wordpress
fi

if wp config get WP_REDIS_HOST --path=/data/www/wordpress;then
  echo "Redis Already Configured."
else
  wp config set WP_REDIS_HOST redis --path=/data/www/wordpress
fi

if wp plugin is-active redis-cache --path=/data/www/wordpress;then
  echo "Redis already Activated."
else
  echo "Activating Redis."
  wp plugin activate redis-cache --path=/data/www/wordpress
  wp redis enable --path=/data/www/wordpress
fi

# Bonus End
php-fpm8 -F