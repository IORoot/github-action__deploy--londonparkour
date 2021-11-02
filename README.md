[![(LIVE) WP01 RELEASE](https://github.com/IORoot/deploy__STAGING/actions/workflows/pushto_webproduction01.yml/badge.svg?branch=master)](https://github.com/IORoot/deploy__STAGING/actions/workflows/pushto_webproduction01.yml)

# Deploying Process

## Deployment to WebProduction01 Server

To deploy onto the staging server you can push to the `master` git branch. Then manually run the github action to deploy.

## Updating this repository with the vagrant version

If you wish to update this repository with the copy on vagrant, use the command;

```
./gitdeploy.sh
```

This is a bash script in the script-library repository (https://github.com/IORoot/script-library/tree/master/deploy) that will do the following steps:

1. SSH into the specified vagrant machine (default dev.londonparkour.com) and run `dumpdb` in the vhost directory.
1. Move the dump file into this repo's `/wp-content/database/` folder so you have a copy of the latest vagrant DB.
1. Recursively update all git submodules in this repo to get all latest copies of themes and plugins.
1. Git add all.
1. Git commit to `master` unless otherwise specified.
1. Git push to github.

The `gitdeploy` command also takes a single argument to push to another branch.

## Post-deployment Tasks

- login with google calendar on the gCal-importer plugin.

## Changelog

v5.1.1
 - Epic-slider mobile resize
 - cache-busting on CSS and JS.

v5.1
 - Epic-slider on homepage
 - Blog CPT
 - New class descriptions on /classes
 - duration of classes
 - subdomains sorted
 - plugins added:   rest-isometric, epic-slider, blog

v5.0.6
- Update wp-plugin__theme--custom-structure

v5.0.5
- wordfence installed
- added coupons
- class locations +waterloo
- changed 'discounts' page
- confirmation emails for PTs no longer have {injected_date}

v5.0.4
- Plugin Updates
- Wordpress update 5.8.1
- Class Locations +Archway
- Confirmation Emails: WhatsApp/Slack links, +Location Links
- Mailchimp on contact form
- contact form update to auto-reply with lateness solutions.
- Support page: Beginners class - lateness.
- Removed border of 5-item section on homepage

v5.0.1 
- Fixes for pulse URL, AMP Titles and favicon.

v5.0.0 
- New Tailwind, lightweight major overhaul of website.