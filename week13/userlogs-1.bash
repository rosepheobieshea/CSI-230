#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.' | tr -d ':')
 echo "$dateAndUser" 
}

function getFailedLogins(){
    cat $authfile | grep "authentication failure" | tr -d ':'
}

# Sending logins as email - Do not forget to change email address
# to your own email s
echo "To: rose.davis@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp rose.davis@mymail.champlain.edu


# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email
echo "To: rose.davis@mymail.champlain.edu" > emailform.txt
echo "Subject: Failed Logins" >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp rose.davis@mymail.champlain.edu


