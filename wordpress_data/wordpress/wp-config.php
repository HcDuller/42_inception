<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'admin' );

/** Database password */
define( 'DB_PASSWORD', '1234' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '6ooO`WM:IZ%HH,%Ws,>+tU4d6!U$`p!]Ia#RihS{8v6CY5r>FI*|v.> Ip$/Fj(w' );
define( 'SECURE_AUTH_KEY',  '3~iVor8YF[SKe?EAAf-HLYUVy]-2G>po1#LU|`ra]`oFY.NI>Ak]M:}K( sKwB=+' );
define( 'LOGGED_IN_KEY',    'I*~:w[}S+l|;(fBi{6Xyy`[:ut)g:o#&WEE.i>#xrolq,248On.H,l2`v$i@]Z!m' );
define( 'NONCE_KEY',        '=(E#uXt{d%v;q*XVC)y@/e8U=B|ygnZum_h^tvzu}pdNkZ:DF9L0gqis_S-<!((J' );
define( 'AUTH_SALT',        ')sKx,rcOF]2]bq lF30HnRPyv*3Ts]x)gLXOX4)(>t-3&jJaHrD[jY(<^Cfp&5i_' );
define( 'SECURE_AUTH_SALT', 'VT(CxU:p*/Fm$OR^E<&$8rfzcV(CkJZ;.yYf4xpDX6cnOK,=@9WLfaik/}cgPBu*' );
define( 'LOGGED_IN_SALT',   '@5nBcu_;S_,<j9d?h5!?Bj:0@?/TtsM{>cW (3#U,Ip}`jjXoa#x1c:X/ v9@#~j' );
define( 'NONCE_SALT',       'XeSF]%9!I/?R[Pbc2)ZCYJb#2wK5z*70sedwrum<Tk!3t;svIfO`Eq/%ln}O#jr~' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
