. (Join-Path $PSScriptRoot Configuration.ps1)
. (Join-Path $PSScriptRoot Email.ps1)
. (Join-Path $PSScriptRoot Scheduler.ps1)
. "C:\Users\champuser\CSI-230\week6\Event-Logs.ps1"
changeConfiguration

$configuration = readConfiguration

$Failed = "something because I didnt do last weeks lab yet"

SendAlertEmail ($Failed | Out-String)

ChooseTimeToRun($configuration.time)