#!/bin/bash

if [ "$#" -ne 1 ]; then
    "Usage: $0 URL" >&2
    exit 1
fi

PAGE=$(curl -s $1)
TESTS="linter-tests.csv"

# Terminal Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;34m'
CYAN='\033[0;36m'
GREY='\033[0;90m'
NC='\033[0m'
# Icons
PASS='\xE2\x9C\x94'
FAIL='\xE2\x9C\x97'

true_false()
{
    INPUT=$1
    REGEX=$2
    MESSAGE=$3

    shopt -s nocasematch
    # uses ERE (Extended Regular Expressions) not PCRE
    if [[ $INPUT =~ $REGEX ]];
    then
        printf "${GREEN} ${PASS} ${NC} PASS | ${MESSAGE}\n";
    else
        printf "${RED} ${FAIL} ${NC} FAIL | ${MESSAGE}\n";
    fi
}

# loop through each line in CSV
loop_line()
{
    while IFS="," read -r REGEX MESSAGE
    do
        true_false "${PAGE}" "${REGEX}" "${MESSAGE}"
    done < <(echo $1)
}

# Loop through file 
while IFS="" read -r p || [ -n "$p" ]
do
    loop_line "${p}" 
done < linter-tests.csv
