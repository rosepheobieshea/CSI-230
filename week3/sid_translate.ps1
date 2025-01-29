$SID = New-Object System.Security.Principal.SecurityIdentifier('S-1-5-21-3315048197-4084779850-781928666-1002')
$User = $SID.Translate([System.Security.Principal.NTAccount])
$uname = $User.Value
$uname
