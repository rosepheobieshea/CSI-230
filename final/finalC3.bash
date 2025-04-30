#!/bin/bash

#adding in start of html doc
echo "\
<html>
<body>
<style>
table, th, td {
border: 1px solid black;
}
</style>
<br>
Logs w/ IOC Indicators
</br>
<table>
<tbody>
<tr>
<th>IP Addr</th>
<th>Date/Time</th>
<th>Access</th>
</tr>" \
> report.html

#finding length of report file
replen=$(wc -l < report.txt)

#looping thru report file and adding entries
for (( i=1; i<=${replen}; i++));
do
    ipaddr=$(sed -n "${i}p" report.txt | cut -d ' ' -f 1 )
    datetime=$(sed -n "${i}p" report.txt | cut -d ' ' -f 2 )
    access=$(sed -n "${i}p" report.txt | cut -d ' ' -f 3 )

    echo "\
    <tr>
    <td> $ipaddr </td>
    <td> $datetime </td>
    <td> $access </td>
    <tr>" \
    >> report.html
done


#adding in last part of html doc
echo "\
</tbody>
</table>
</body>
</html>" \
>> report.html

sudo cp report.html /var/www/html/
sudo systemctl reload apache2
