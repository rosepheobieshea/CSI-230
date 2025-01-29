function getLogonEvents($days){

$loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays("-"+"$days")

$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++){

$event = ""
if($loginouts[$i].InstanceId -eq "7001") {$event="Logon"}
if($loginouts[$i].InstanceId -eq "7002") {$event="Logoff"}

$user = $loginouts[$i].ReplacementStrings[1]
$SID = New-Object System.Security.Principal.SecurityIdentifier $user
$tuser = $SID.Translate([System.Security.Principal.NTAccount])
$uname = $tuser.Value

$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated;
   "id" = $loginouts[$i].EventID;
   "Event" = $event;
   "User" = $tuser;
   }
}
return $loginoutsTable
}