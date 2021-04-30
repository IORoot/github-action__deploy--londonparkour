#!/bin/bash


if [ "$#" -ne 2 ]; then
    "Usage: $0 SITEMAPURL OUTDIR" >&2
    exit 1
fi

SITEMAP=$1
OUTDIR=$2

create_list()
{
    URLS=$(curl -s $SITEMAP | grep -e loc | sed 's|<loc>\(.*\)<\/loc>$|\1|g' | xargs -I {} curl -s {} | grep -e loc | sed 's|<loc>\(.*\)<\/loc>$|\1|g')
}
create_list


for PAGE in $URLS 
do
    DOMAIN=$( echo $PAGE | awk -F// '{print $NF}')
    PARSE=$( echo $DOMAIN | sed 's/[\/|\.|-]/_/g')
    FILE=$( echo $PARSE | sed 's/_$//g')
    curl -s "https://validator.w3.org/nu/?out=json&doc=$PAGE" > /tmp/${OUTDIR}/${FILE}.json
done