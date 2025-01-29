function getPowerEvents($days){

$pwrevents = Get-EventLog System -After (Get-Date).AddDays("-"+"$days") | Where-Object { ($_.EventID -eq "6005") -or ($_.EventID -eq "6006") }

$pwreventsTable = @()
for($i=0; $i -lt $pwrevents.Count; $i++){

$event = ""
if($pwrevents[$i].EventId -eq "6005") {$event="Power On"}
if($pwrevents[$i].EventId -eq "6006") {$event="Power Off"}

$pwreventsTable += [pscustomobject]@{"Time" = $pwrevents[$i].TimeGenerated;
   "id" = $pwrevents[$i].EventID;
   "Event" = $event;
   "User" = "System";
   }
}
return $pwreventsTable
}