
$filepath= Join-Path "$PSScriptRoot" "output.csv"
$processes=Get-Service

$processes | Where-Object { $_.Status -eq "Stopped" } | Sort-Object | Export-Csv -Path $filepath