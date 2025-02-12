cls
. (Join-Path $PSScriptRoot apache-logs.ps1)
. (Join-Path $PSScriptRoot ApacheLogs1.ps1)

$page = Read-Host -Prompt "What page name do you want to search for?"
$code = Read-Host -Prompt "What status code do you want to search for?"
$browser = Read-Host -Prompt "What browser name do you want to search for?"

$func = apache-logs.ps1 $page, $code, $browser
$func

$func2 = ApacheLogs1.ps1
$func2
