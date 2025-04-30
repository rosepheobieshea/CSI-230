#!/bin/bash

link="10.0.17.6/Assignment.html"

fullPage=$(curl -sL "$link")

toolOutput=$(echo "$fullPage" | \
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --copy-of \
"//html//body//table//tr//td")

printf "%s" "$toolOutput" | sed 's/<\/td>/\n/g' | sed 's/<td>//g'
