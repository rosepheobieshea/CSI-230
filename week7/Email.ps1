﻿function SendAlertEmail($body){

$from = "rose.davis@mymail.champlain.edu"
$to = "rose.davis@mymail.champlain.edu"
$subject = "sus activity"

$password = "fajt hkyt kfbx uaeq" | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $from, $password

Send-MailMessage -From $from -To $to -Subject $subject -Body $body -SmtpServer "smtp.gmail.com" -Port 587 -UseSsl -Credential $credential
}
