function apache-logs($page, $code, $browser){

$records = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern $page, $code, $browser

$regex = [regex] "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b"

$ipunorg = $regex.Matches($records)

$ips = @()
for($i=0; $i -lt $ipunorg.Count; $i++){
    $ips += [pscustomobject]@{ "IP" = $ipunorg[$i].Value; }
    }
#$ips | Where-Object { $_.IP -ilike "10.*" }


$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }

$counts = $ipsoftens | Group-Object IP
return $counts | Select-Object Count, Name
}