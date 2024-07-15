$Search = ""
$Users = Get-ADUser -filter * -SearchBase $Search
$progress = 0

foreach ($User in $Users) {
    Set-ADUser -Identity $User -Department "Plessis"

    $progress = $progress+1
    $pourcentage = [math]::Round($progress/$Users.Length*100,2)
    Write-Progress -Activity "Change in Progress" -Status "$pourcentage% Complete:" -PercentComplete $pourcentage
}