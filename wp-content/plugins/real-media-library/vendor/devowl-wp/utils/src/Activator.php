<?php

namespace MatthiasWeb\RealMediaLibrary\Vendor\MatthiasWeb\Utils;

\defined('ABSPATH') or die('No script kiddies please!');
// Avoid direct file request.
/**
 * The activator class handles the plugin relevant activation hooks: Uninstall, activation,
 * deactivation and installation. The "installation" means installing needed database tables.
 */
trait Activator {
    /**
     * Install tables, stored procedures or whatever in the database.
     * This method is always called when the version bumps up or for
     * the first initial activation.
     *
     * @param boolean $errorlevel If true throw errors.
     */
    abstract public function dbDelta($errorlevel);
    /**
     * Indexes have a maximum size of 767 bytes. Historically, we haven't need to be concerned about that.
     * As of 4.2, however, we moved to utf8mb4, which uses 4 bytes per character. This means that an index which
     * used to have room for floor(767/3) = 255 characters, now only has room for floor(767/4) = 191 characters.
     *
     * @see https://github.com/WordPress/WordPress/blob/5f9cf0141e2e32f47ae7f809b7a6bbc0d4bd4ef2/wp-admin/includes/schema.php#L48-L53
     * @codeCoverageIgnore
     */
    public function getMaxIndexLength() {
        return 191;
    }
    /**
     * Run an installation or dbDelta within a callable.
     *
     * @param boolean $errorlevel Set true to throw errors.
     * @param callable $installThisCallable Set a callable to install this one instead of the default.
     */
    public function install($errorlevel = \false, $installThisCallable = null) {
        global $wpdb;
        // @codeCoverageIgnoreStart
        if (!\defined('PHPUNIT_FILE')) {
            require_once ABSPATH . 'wp-admin/includes/upgrade.php';
        }
        // @codeCoverageIgnoreEnd
        // Avoid errors printed out.
        if ($errorlevel === \false) {
            $show_errors = $wpdb->show_errors(\false);
            $suppress_errors = $wpdb->suppress_errors(\false);
            $errorLevel = \error_reporting(0);
        }
        if ($installThisCallable === null) {
            $this->dbDelta($errorlevel);
        } else {
            \call_user_func($installThisCallable);
        }
        if ($errorlevel === \false) {
            $wpdb->show_errors($show_errors);
            $wpdb->suppress_errors($suppress_errors);
            \error_reporting($errorLevel);
        }
        if ($installThisCallable === null) {
            update_option(
                $this->getPluginConstant(
                    \MatthiasWeb\RealMediaLibrary\Vendor\MatthiasWeb\Utils\PluginReceiver::$PLUGIN_CONST_OPT_PREFIX
                ) . '_db_version',
                $this->getPluginConstant(
                    \MatthiasWeb\RealMediaLibrary\Vendor\MatthiasWeb\Utils\PluginReceiver::$PLUGIN_CONST_VERSION
                )
            );
        }
    }
}
