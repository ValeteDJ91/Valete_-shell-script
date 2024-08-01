Connect-MsolService

$Users = Import-Csv -Path c:\temp\effilux_365.csv -delimiter ";" 
$progress = 0

foreach ($User in $Users) {
    Write-Host "Modifying:" $User.userprincipalname
    
    if ($User.title -ne "") { Set-MsolUser -UserPrincipalName $User.userprincipalname -Title $User.title }
    if ($User.department -ne "") { Set-MsolUser -UserPrincipalName $User.userprincipalname -Department $User.department }
    if ($User.Office -ne "") { Set-MsolUser -UserPrincipalName $User.userprincipalname -Office $User.Office }
    if ($User.mobile -ne "") { Set-MsolUser -UserPrincipalName $User.userprincipalname -MobilePhone $User.mobile }
    if ($User.telephonenumber -ne "") { Set-MsolUser -UserPrincipalName $User.userprincipalname -Phone $User.telephonenumber }
    if ($User.StreetAddress -ne "") { Set-MsolUser -UserPrincipalName $User.userprincipalname -StreetAddress $User.StreetAddress }
    if ($User.State -ne "") { Set-MsolUser -UserPrincipalName $User.userprincipalname -State $User.State }
    if ($User.City -ne "") { Set-MsolUser -UserPrincipalName $User.userprincipalname -City $User.City }
    if ($User.PostalCode -ne "") { Set-MsolUser -UserPrincipalName $User.userprincipalname -PostalCode $User.PostalCode }

    $progress = $progress+1
    $pourcentage = [math]::Round($progress/$Users.Length*100,2)
    Write-Progress -Activity "Change in Progress" -Status "$pourcentage% Complete:" -PercentComplete $pourcentage
}