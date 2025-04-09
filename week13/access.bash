#1/bin/bash
date=$(date)
echo "File was accessed $date" | tr ":" "-" >> /home/pheobie/CSI-230/week13/fileaccesslog.txt
cat /home/pheobie/CSI-230/week13/fileaccesslog.txt | ssmtp "rose.davis@mymail.champlain.edu"
