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
define( 'DB_USER', 'hdecamp' );

/** Database password */
define( 'DB_PASSWORD', 'thisIs4psw' );

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
define( 'AUTH_KEY',         '(BPdwC:7dT_^)d_%Xxm6[Z+& c6/AsZQ@K(K8%YRIFUgs&!EWoG#3o ($=v(;Y`(' );
define( 'SECURE_AUTH_KEY',  '-8y2,dC4zp?qg(**J*HOq&E,^(9-ushX?^2A=WZXbcZPU6lmwUQ[GB0CV`EB Re5' );
define( 'LOGGED_IN_KEY',    'N#OPtf~wXKLrt!rr8ih8mF#^#xup8*__GOYC ,CK<inzPR^et{TUb5WDapSRj]_q' );
define( 'NONCE_KEY',        '3gqt^|4npi.KiI^z(UcO9gKpGaoprMW#{w7%cpv}HI<< eDp;]6mo_dmN9nIV3Nx' );
define( 'AUTH_SALT',        'Rn~93Z[x$U6_c!DLLt( (cAi/rxDA)U.?Xdsh(Q0p3ho@eBEKM)v14>uv2|=x>42' );
define( 'SECURE_AUTH_SALT', 'mG /A,9`PQI_u%BvljFDl<j=PhX}eRsCPRC$QKE3H/m~vU!se!{~YP4/>w(-wxB#' );
define( 'LOGGED_IN_SALT',   '3|D-+i[W0CdU=h-$_6(UQA6$NQ@-si-/^xY2o/8V3Z%nQ.X>x$A0Y!Fn]#|G[STE' );
define( 'NONCE_SALT',       'KAzV)]{~t`M3;$(tWwwvIu#;>R>:c}=/PzPGR#jg~5,D2dW+!kDWR,+je}bXn8eY' );

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
