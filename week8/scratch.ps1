. (getIOC)
. (getLogs)


$iocPattern = getIOC | Select-Object -ExpandProperty "Pattern"

$allResults = foreach ($pattern in $iocPattern){
    $logs = getLogs | Where-Object { $_.Page -like "*$pattern*" }
    $logs
    }

$uniqueResults = $allResults | Group-Object IP, Time, Method, Page, Protocol, Response, Referer | ForEach-Object { $_.Group | Select-Object -First 1}

$uniqueResults | Format-Table