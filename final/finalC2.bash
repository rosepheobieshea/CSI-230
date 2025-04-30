#!/bin/bash
cat access.log | egrep -i -f IOC.txt
