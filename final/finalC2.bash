#!/bin/bash
cat access.log | egrep -i -f IOC.txt | cut -d ' ' -f 1,4,7 | tr -d "[" > report.txt
