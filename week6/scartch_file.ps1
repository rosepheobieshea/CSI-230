 $plainpassword = "!"
# Write-Host $plainpassword.Length
$specialChar = [regex] "[~`!@#\$%\^&\*\(\)_\+=-\]\[\\\{\}\|';:<>\?,\./]"
$numChar = [regex] "[0-9]+"
$letterChar = [regex] "[A-Za-z]+"
 
$goodpass = @()
if ($plainpassword.Length -ge 6) {
if ($plainpassword -match $specialChar){
if ($plainpassword -match $numChar){
if ($plainpassword -match $letterChar){
$goodpass = $true
}
}
}
}
if($goodpass -eq $true){
    Write-Host "good pass"
    }
    else{
    Write-Host "bad pass"
    }