<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ' T1;lu%_}X@;,8?{^r!vLKC<MA55?B5wN=b^0JA`*HIG&1<(=@yz>lo}twK.:v$3');
define('SECURE_AUTH_KEY',  '>!_{(_T.5,vndwT/K6}~0^PHq?Z}6vzN1+JKDiTj6Zp?zW#v5)Bj+i0+[+!)opw|');
define('LOGGED_IN_KEY',    '+5tu>o@|Y6DP/I2%9<ST+2[Hc&#i^]ke1wh)0g1K_-PSs6JFmm)j:Jm5w{0<eqU ');
define('NONCE_KEY',        'G8P-W@sTy|%Zw6FTNN4*~iAxp(sVdoA+~$[-F_@)49CGS$ZC9</>+7{>+E5n^X5w');
define('AUTH_SALT',        'OJ?1%B`@(R5&A3|CH;xSZv|!45P|^)f#9$n.a0Fd5EUsd>L9fyP7=~]HFu9T_Y<{');
define('SECURE_AUTH_SALT', 's)uU8mv|o1glpggZ?FKW!9w3E04(z-mp0uXdOnu(`+v,iTIov,c.}9UaPJOX?b}8');
define('LOGGED_IN_SALT',   '4f7!7n?R@=DOa& 4xOgAy[-^>C{V9v/kn?+&yJphpc7)|DMMo8HlYL/O4_jNb;VQ');
define('NONCE_SALT',       'w*StYo@.7zX/-C}Akk<T[DIuv^LaHn,U3/WS;XUb10.1>;T;Bt9/P2rTuU|9sA~G');

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );