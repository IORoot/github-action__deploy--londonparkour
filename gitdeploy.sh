#!/bin/bash

# 1. dump_database  
# 2. Copy dump to this reepo 
# 3. update all submodules 
# 4. git add > commit > push 


GIT_BRANCH='master'
LOCAL_PROJECT_LOCATION='/Users/andypearson/Repository/Code/LondonParkour.com/dev.londonparkour.com'
VAGRANT_MACHINE='dev.londonparkour.com'
DUMP_COMMAND='dev.londonparkour.com_dumpdb'


get_vagrant_id(){

    printf "${Cyan}Getting vagrant box ID.\n"

    ID=`vagrant global-status | grep "$VAGRANT_MACHINE" | cut -d ' ' -f 1 `
    if [ ! ${#ID} -eq 7 ]; 
        then
            printf "${Red}Machine Not Found\n"
            exit 1
        else 
            printf "${Green}Machine Found for ${VAGRANT_MACHINE}. ID: ${ID} \n" ;
    fi
}


dump_database(){
    printf "${Cyan}Dumping DB.${Green}\n"
    vagrant ssh $ID -c "sudo ${DUMP_COMMAND}"

    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        printf "${Green}Dumped Database Successful\n"
    else
        printf "${Red}Failed DB Dump\n"
        exit 1
    fi
    
}


move_vagrant_db_to_deploy_repo(){
    printf "${Cyan}Moving Vagrant Database to this deploy repo.\n"
    sudo mv $LOCAL_PROJECT_LOCATION/wp-content/database/*.sql ./wp-content/database/

    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        printf "${Green}Moved to ./wp-content/database/\n"
    else
        printf "${Red}Failed Move\n"
        exit 1
    fi 
}


update_all_submodules(){
    printf "${Cyan}Updating all git submodules recursively.\n"
    git submodule update --recursive --remote
    printf "${Green}All submodules pulled.\n"
}


commit_changes_to_repo(){
    printf "${Cyan}Commit repo to the ${GIT_BRANCH} branch.\n"
    git add .
    git commit -m "deploy to ${GIT_BRANCH} branch"
    git push origin $GIT_BRANCH

    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        printf "${Green}Repository pushed to origin.\n"
    else
        printf "${Red}Failed Git Add > Commit > Push\n"
        exit 1
    fi 
    
}


pre_deploy_message(){
    printf "${NC}----------------------------------------\n"
    printf "${Red}           gitdeploy tool\n"
    printf "${Yellow} Deploying to STAGING Server.\n"
    printf "${NC}----------------------------------------\n"
}


post_deploy_message(){
    printf "\n${Red}Post-Deploy Tasks.\n"
    printf "${Orange}1. Manually login to GCal Sync OAUTH.\n"
    printf "${Orange}2. Enter License into WP Real Media Library Plugin.\n\n"

    printf "\n${Red}Manually push to WP01 through github actions.\n"
}

read_confirm(){

    printf "\n${Orange}Push to github Y/n?.\n"
    read CONFIRM
    if [[ $CONFIRM == 'Y' ]]; then
        printf "${Green}Pushing.\n"
    else
        printf "${Orange}Exit.\n"
        exit 1
    fi
}

cli_colours() {
    NC='\033[0m'               # NO Colour (reset)
    Black='\033[0;30m'         # Black
    Red='\033[0;31m'           # Red
    Green='\033[0;32m'         # Green
    Yellow='\033[0;33m'        # Yellow
    Orange='\033[0;34m'        # Orange
    Purple='\033[0;35m'        # Purple
    Cyan='\033[0;36m'          # Cyan
    White='\033[0;37m'         # White
}


cli_colours
pre_deploy_message
get_vagrant_id 
dump_database  
move_vagrant_db_to_deploy_repo 
update_all_submodules 
read_confirm
commit_changes_to_repo 
post_deploy_message