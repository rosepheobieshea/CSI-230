. (Join-Path $PSScriptRoot getLogonEvents.ps1)
. (Join-Path $PSScriptRoot getPowerEvents.ps1)

cls

$num_days = Read-Host -Prompt "How many days back do you want to look?"

$func1 = getLogonEvents $num_days
$func1

$func2 = getPowerEvents $num_days
$func2