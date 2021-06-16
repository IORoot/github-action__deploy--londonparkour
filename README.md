# Deploying Process

## Deployment to Staging Server

To deploy onto the staging server you can push to the `master` git branch. This will trigger the necessary steps to fully build the site from the code in this repository.

## Updating this repository with the vagrant version

If you wish to update this repository with the copy on vagrant, use the command;

```
gitdeploy
```

This is a bash script in the script-library repository (https://github.com/IORoot/script-library/tree/master/deploy) that will do the following steps:

1. SSH into the specified vagrant machine (default dev.londonparkour.com) and run `dumpdb` in the vhost directory.
1. Move the dump file into this repo's `/wp-content/database/` folder so you have a copy of the latest vagrant DB.
1. Recursively update all git submodules in this repo to get all latest copies of themes and plugins.
1. Git add all.
1. Git commit to `master` unless otherwise specified.
1. Git push to github.

The `gitdeploy` command also takes a single argument to push to another branch.

## Deployment with tests (QA)

To trigger tests, you can do this in two ways:

1. To globally run ALL tests, you can add `-test` into the commit message and push to `master` branch.
1. To run an individual test, you can add it's specific name as a flag to the commit message and push to the `master` branch.
    1. `-lighthouse`
    1. `-links`
    1. `-browserstack`s
    1. `-pa11y`
    1. `-screencpature`
    1. `-validator`


## Deployment to LIVE

To deploy to the live server, you need to add a release to this repository.

To do this, add a new release tag and push to master.

```
git tag v5.0.1
git add .
git commit -m "New LIVE Release"
git push origin master
```

## Post-deployment Tasks

- login with google calendar on the gCal sync plugin.
