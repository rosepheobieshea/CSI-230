#!/bin/bash

file="/var/log/apache2/access.log"
cat "$file" | cut -d' ' -f1,7 | tr -d "/" | grep "page2.html"
