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
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define( 'AUTH_KEY',          'X+O}k*SKdcTPWvE57^ke^$kp9dITZ9-oTr_PDH(3R9#7?NXwhsE`gWVMjdgPKg1 ' );
define( 'SECURE_AUTH_KEY',   'ne?I ,NuhQV5sj*|&oa66vv8[o*-H%&)}dRv2?81#{eoWt$4p@&v9?{cQpa|w.xA' );
define( 'LOGGED_IN_KEY',     '-4$e`Nl;C=cY3O4.0nE9 C$FL$$Nk1:4!6?7f)gCE0mpuu,Qsa.h6%iMdTOr,x2b' );
define( 'NONCE_KEY',         'DN4dZ{J&&49LvunY6oy~JnCI.bb;&[mgU2a|XQ5-{:B *-,.>?;}86*)*oon@sV?' );
define( 'AUTH_SALT',         'jca|o51@*#.mX4T`V|*-Wt]5kN@tB.$HW#zYSa(pMP4Z>>-xsI)UPAu_U$9aW7G1' );
define( 'SECURE_AUTH_SALT',  '~EP6:}rtgfQ8s-?qt)jFqIA +-HxzeP6:`}}lE}c6UNKrubw&xh_T)qMS$mRmKh/' );
define( 'LOGGED_IN_SALT',    'f]pSt;Phh.xX?9%`<$X`A{N,jxfFENKGt=Q)D}9m tU}kY;yGmCC3y{PX3-x-|I~' );
define( 'NONCE_SALT',        'gxl*D/Q^8gVg|*LgaGDF`q]ku}5>mLz.}ssh#,-fJS;i.7->,wMrkwmnu%+h`IHw' );
define( 'WP_CACHE_KEY_SALT', 'MxdrN()-o#73)zFcJvCP=wni$+#Rj!Y7(/,0I6O>[Jp(,|.:8p+?StW-1OoiD2oS' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
