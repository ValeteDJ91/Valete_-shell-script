$Users = Import-Csv -Path c:\temp\effilux_ad.csv -delimiter ";" 
$progress = 0

foreach ($User in $Users) {
    $distinguishedName = $User.userprincipalname.split('@')[0]
    Write-Host "Modifying:" $distinguishedName
    
    if ($User.title -ne "") { Set-ADUser -Identity $distinguishedName -Title $User.title }
    if ($User.department -ne "") { Set-ADUser -Identity $distinguishedName -Department $User.department }
    if ($User.mobile -ne "") { Set-ADUser -Identity $distinguishedName -MobilePhone $User.mobile }
    if ($User.telephonenumber -ne "") { Set-ADUser -Identity $distinguishedName -OfficePhone $User.telephonenumber }
    if ($User.StreetAddress -ne "") { Set-ADUser -Identity $distinguishedName -StreetAddress $User.StreetAddress }
    if ($User.State -ne "") { Set-ADUser -Identity $distinguishedName -State $User.State }
    if ($User.City -ne "") { Set-ADUser -Identity $distinguishedName -City $User.City }
    if ($User.PostalCode -ne "") { Set-ADUser -Identity $distinguishedName -PostalCode $User.PostalCode }

    $progress = $progress+1
    $pourcentage = [math]::Round($progress/$Users.Length*100,2)
    Write-Progress -Activity "Change in Progress" -Status "$pourcentage% Complete:" -PercentComplete $pourcentage
}