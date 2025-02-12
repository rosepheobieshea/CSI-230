cls
. (Join-Path $PSScriptRoot apache-logs.ps1)

$page = Read-Host -Prompt "What page name do you want to search for?"
$code = Read-Host -Prompt "What status code do you want to search for?"
$browser = Read-Host -Prompt "What browser name do you want to search for?"

$func = apache-logs.ps1 $page, $code, $browser
$func