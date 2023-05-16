#!/bin/sh

if wp config path --path=/data/www/wordpress >/dev/null 2>&1; then
  echo "."
else
  wp config create --dbname="$DBNAME" --dbuser="$DBUSER" --dbpass="$DBPSW" --dbhost=mariadb --path=/data/www/wordpress
fi

if wp db check --path=/data/www/wordpress >/dev/null 2>&1; then
  echo ".."
else
  wp db create --path=/data/www/wordpress
fi

if wp core is-installed --path=/data/www/wordpress >/dev/null 2>&1; then
  echo "..."
else
  wp core install --path=/data/www/wordpress --url=hde-camp.42.fr --title="hde-inception" --admin_user="$WPADM" --admin_password="$WPADMPSW" --admin_email=sUser@fake.org
  wp user create --path=/data/www/wordpress "$WPUSR" "evaluator@fake.org" --role=editor --user_pass="$WPUSRPSW" --display_name="42Evaluator" --user_nicename="Nice_Eval" --nickname="Eval_Guy"
fi

php-fpm8 -F