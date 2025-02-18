. (Join-Path $PSScriptRoot class-scraper.ps1)

$allClasses = gatherClasses

$ITSInstructors = $allClasses | Where-Object { ($_."Class Code" -ilike "SYS*") -or
                                               ($_."Class Code" -ilike "NET*") -or
                                               ($_."Class Code" -ilike "SEC*") -or
                                               ($_."Class Code" -ilike "FOR*") -or
                                               ($_."Class Code" -ilike "CSI*") -or
                                               ($_."Class Code" -ilike "DAT*") }

#$ITSInstructors | Sort-Object "Instructor" -Unique |  Format-Table "Instructor"

$allClasses | Group-Object { $_.Instructor -in $ITSInstructors.Instructor } | Select-Object Count, Name `
 | Sort-Object Count -Descending