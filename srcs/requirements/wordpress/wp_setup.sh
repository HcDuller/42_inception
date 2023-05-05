sed -i "s/^.*DB_NAME.*$/define('DB_NAME', '${DBNAME}');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*DB_USER.*$/define('DB_USER', '${DBUSER}');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*DB_PASSWORD.*$/define('DB_PASSWORD', '${DBPSW}');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*DB_HOST.*$/define('DB_HOST', 'mariadb');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*DB_CHARSET.*$/define('DB_CHARSET', 'utf8mb4');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*'AUTH_KEY'.*$/define('AUTH_KEY',         '-GG\/4K xk1UJ#rjr[HsU^NFhnH >{GICFi5=epQdr+HJKZ{g\`STc)rEMnyl\|\/uu}');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*'SECURE_AUTH_KEY'.*$/define('SECURE_AUTH_KEY',  ')+rP(v6>bKPqj@hJG%-V1q0[l=D?u*}y86F+@5^?:aijB|:-9,E(X>e>@y2E0gJR');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*'LOGGED_IN_KEY'.*$/define('LOGGED_IN_KEY',    '\!ez\`dJtAddu\&w-}+by}>n,)<)Vms,hn%\/\|[2iLa.Az(YHn*\$E2%O?JSRc\|\!NsfQ*');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*'NONCE_KEY'.*$/define('NONCE_KEY',        '+-8:vd%pwiO4C@4#\|YJ}Za?Ymqz3dXGQ]= nj#-\|u]r\`6LigGa\$*H>++zEfJfKps');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*'AUTH_SALT'.*$/define('AUTH_SALT',        '@4y\&, UNW\|G5t-[@K(SXi~jB(@+_fM+=Hk>8b>sg654-:r6T@\|\!eXA6-zeF}i:Hp');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*'SECURE_AUTH_SALT'.*$/define('SECURE_AUTH_SALT', '~X_,=}\&{{\!\&sAF\|?9+~X^{R3Q0<@\$Xg)8\|^~9-oefE#dNBG\&]-[XsFvE(8yqtv9_');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*'LOGGED_IN_SALT'.*$/define('LOGGED_IN_SALT',   'AEk6lu,\`;g#v;de7Hqn8p%h\$\!DoGuP)Zm{.k^-P.F?-R-(z+\&j;:gw+0lY:6N7[P');/" /data/www/wordpress/wp-config.php
sed -i "s/^.*'NONCE_SALT'.*$/define('NONCE_SALT',       'z4dGvO0-{yz+iZBKX}}bcmJ];a^~30)=v\/[C)F_Z#CjSln\|8Q)Hn@#53SV*6o-\`x');/" /data/www/wordpress/wp-config.php
