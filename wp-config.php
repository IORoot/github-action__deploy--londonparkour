<?php

	/** Site Definition */
	define('WP_HOME',	'http://localhost');
	define('WP_SITEURL','http://localhost');

	/** Database */
	define('DB_NAME', 		'dev_londonparkour_com');
	define('DB_USER', 		'ldnpk');
	define('DB_PASSWORD', 	'123abc');
	define('DB_HOST', 		'localhost');
	define('DB_CHARSET', 	'utf8');
	define('DB_COLLATE', 	'');
	$table_prefix  = 'wp_';

	/** Salts */
	define('AUTH_KEY',         	'put your unique phrase here');
	define('SECURE_AUTH_KEY',  	'put your unique phrase here');
	define('LOGGED_IN_KEY', 	'put your unique phrase here');
	define('NONCE_KEY', 		'put your unique phrase here');
	define('AUTH_SALT', 		'put your unique phrase here');
	define('SECURE_AUTH_SALT', 	'put your unique phrase here');
	define('LOGGED_IN_SALT', 	'put your unique phrase here');
	define('NONCE_SALT', 		'put your unique phrase here');

	/** Debugging */
	define('WP_DEBUG',			true);
	define('WP_DEBUG_DISPLAY',	false);
	define('WP_DEBUG_LOG',		true);
	error_reporting( E_ERROR | E_STRICT | E_CORE_ERROR ); 

	/** Features */
	define('QM_NO_JQUERY', 				true);
	define('ALLOW_UNFILTERED_UPLOADS', 	true);
	define('WP_CACHE', 					true); // Added by WP Rocket


	/** Absolute path to the WordPress directory. */
	if ( !defined('ABSPATH') )
		define('ABSPATH', dirname(__FILE__) . '/');

	/** Sets up WordPress vars and included files. */
	require_once(ABSPATH . 'wp-settings.php');