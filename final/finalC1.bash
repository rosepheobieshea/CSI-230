#! /bin/bash

# This is the link we will scrape
link="10.0.17.6/IOC.html"

# get it with curl and tell curl not to give errors
fullPage=$(curl -sL "$link")

# Utilizing xmlstarlet tool to extract table from the page
toolOutput=$(echo "$fullPage" | \
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --copy-of \
"//html//body//table//tr//td[1]")

# Processing HTML with sed
# 1- Replacing every </tr> with a line break
printf "%s" "$toolOutput" | sed 's/<\/td>/\n/g' | sed 's/<td>//g' > IOC.txt
