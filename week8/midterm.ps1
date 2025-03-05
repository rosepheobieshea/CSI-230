cls

function getIOC(){
$page = Invoke-WebRequest -TimeoutSec 2 http://localhost/IOC.html

$trs = $page.ParsedHtml.body.getElementsByTagName("tr")

$IOCtable = @()

for($i=1; $i -lt $trs.length; $i++){
   $tds = $trs[$i].getElementsByTagName("td")

   $IOCtable += [PSCustomObject]@{"Pattern" = $tds[0].innerText
                               "Explanation" = $tds[1].innerText}
   }

return $IOCtable
}

getIOC

function getLogs(){
$rawLog = Get-Content C:\Users\champuser\CSI-230\week8\access.log

$recordTable = @()

for($i=0; $i -lt $rawLog.Count; $i++){

$records = $rawLog[$i].Split(" ");

$recordTable += [pscustomobject]@{"IP" = $records[0];
                                  "Time" = $records[3].trim('[');
                                  "Method" = $records[5].Trim('"');
                                  "Page" = $records[6];
                                  "Protocol" = $records[7];
                                  "Response" = $records[8];
                                  "Referer" = $records[10]; }
}
return $recordTable
}

function getAlerts(){
$iocPattern = getIOC | Select-Object -ExpandProperty "Pattern"

$allResults = foreach ($pattern in $iocPattern){
    $logs = getLogs | Where-Object { $_.Page -like "*$pattern*" }
    $logs
    }

$uniqueResults = $allResults | Group-Object IP, Time, Method, Page, Protocol, Response, Referer | ForEach-Object { $_.Group | Select-Object -First 1}
return $uniqueResults
}
