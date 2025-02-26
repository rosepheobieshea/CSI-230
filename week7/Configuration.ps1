function readConfiguration(){
        $config = Get-Content -Path $PSScriptRoot/configuration.txt

        $conf_table = @()
        $conf_table += [pscustomobject]@{"Days" = $config[0];
                                        "Time" = $config[1]; }
        return $conf_table
        }

function changeConfiguration(){
        Write-Host "How many days back do you want to look back in the logs?" | Out-String
        $days = Read-Host
        $days = $days -replace "[a-zA-Z]"

        Write-Host "What time do you want to run the task? Enter your time in hh:mm AM/PM format. `n" | Out-String
        $time = Read-Host
        $format_check = $time -match "[0-9]{1,2}\:[0-9]{2}\s[AP]M"
        if($format_check -eq $true){
            $days, $time | Out-File -FilePath $PSScriptRoot/configuration.txt
            Write-Host "Config changed."
            }
            else{
                Write-Host "That is not a valid time. Please try again"
                exit
                }
                }

function configurationMenu(){
$prompt = "`n"
$prompt += "1 - Show Configuration: `n"
$prompt += "2 - Change Configuration: `n"
$prompt += "3 - Exit: `n"

$operation = $true

while($operation){

    Write-Host $prompt | Out-String
    $choice = Read-Host

    if($choice -eq 3){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false
        }

    elseif($choice -gt 3){
        Write-Host "That is not a valid choice, please choose an option listed." | Out-String
        }

    elseif($choice -eq 1){
        readConfiguration
        }
        
    elseif($choice -eq 2){
        changeConfiguration
        }
        }
        }