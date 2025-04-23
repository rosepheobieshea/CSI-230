#!/bin/bash

myIP=$(bash myIP.bash)


# Todo-1: Create a helpmenu function that prints help for the script
function helpmenu(){
echo "*Help Section*
-n use nmap
external: external nmap scan
internal: internal nmap scan

-s us ss
external: external ss scan
internal: internal ss scan
"
}

# Return ports that are serving to the network
function ExternalNmap(){
  rex=$(nmap "${myIP}" | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
  echo ${rex}
}

# Return ports that are serving to localhost
function InternalNmap(){
  rin=$(nmap localhost | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
  echo ${rin}
}


# Only IPv4 ports listening from network
# Todo-2: Complete the ExternalListeningPorts that will print the port and application
# that is listening on that port from network (using ss utility)
function ExternalListeningPorts(){
  elpo=$(ss -ltpn | grep -v "\[::1]\|127\|Send" | awk -F"[[:space:]]+" '{print $3,$4}' | tr -d "*:")
  echo ${elpo}
}


# Only IPv4 ports listening from localhost
function InternalListeningPorts(){
  ilpo=$(ss -ltpn | awk  -F"[[:space:]:(),]+" '/127.0.0./ {print $5,$9}' | tr -d "\"")
  echo ${ilpo}
  }



# Todo-3: If the program is not taking exactly 2 arguments, print helpmenu
if [ ${#} -eq 3 ]; then
  helpmenu
fi

# Todo-4: Use getopts to accept options -n and -s (both will have an argument)
# If the argument is not internal or external, call helpmenu
# If an option other then -n or -s is given, call helpmenu
# If the options and arguments are given correctly, call corresponding functions
# For instance: -n internal => will call NMAP on localhost
#               -s external => will call ss on network (non-local)
while getopts "n:s:" option
do
  case $option in
  n)
    if [ ${OPTARG} == "external" ]; then
      ExternalNmap
    else
      InternalNmap
    fi
  ;;
  s)
    if [ ${OPTARG} == "external" ]; then
      ExternalListeningPorts
    else
      InternalListeningPorts
    fi
  ;;
  ?)
    helpmenu
  ;;
  esac
done


