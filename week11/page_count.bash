#!/bin/bash

function page_count()
{
file="/var/log/apache2/access.log"
pages=$(cat "$file" | cut -d' ' -f7)

index_count=$(echo $pages | grep -o "/index.html" | wc -l)
page1_count=$(echo $pages | grep -o "/page1.html" | wc -l)
page2_count=$(echo $pages | grep -o "/page2.html" | wc -l)
root_count=$(echo $pages | grep -o "/" | wc -l)
#echo "$pages"
printf " $root_count / \n $index_count /index.html \n $page1_count /page1.html \n $page2_count /page2.html \n "
}

function counting_curl_access()
{
file="/var/log/apache2/access.log"
access_count=$(cat "$file" | cut -d' ' -f1,12 | grep "curl" | wc -l)
access_name=$(cat "$file" | cut -d' ' -f1,12 | grep "curl" | uniq)
printf "$access_count $access_name \n"
}

counting_curl_access
