#!/bin/bash

[ $# -ne 1 ] && echo "Usage: $0 <Prefix>" && exit 1

prefix=$1

[ ${#prefix} -le 5 ] && printf "Prefix length is too short! \n" && exit 1

for i in {227..240}
do
	ping -c 1 "$prefix.$i" | grep "64 bytes" | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
done
