$Users = Import-Csv -Path c:\temp\printers.csv -delimiter ";" 
$progress = 0

foreach ($User in $Users) {
    $distinguishedName = $User.userprincipalname.split('@')[0]
    Write-Host "Adding:" $distinguishedName
    
    Add-ADGroupMember -Identity "PRINTER" -Members $distinguishedName
    Add-ADGroupMember -Identity "PRINTER" -Members $distinguishedName
    Add-ADGroupMember -Identity "PRINTER" -Members $distinguishedName
    Add-ADGroupMember -Identity "PRINTER" -Members $distinguishedName
    Add-ADGroupMember -Identity "PRINTER" -Members $distinguishedName
    Add-ADGroupMember -Identity "PRINTER" -Members $distinguishedName
    if ($User.printer -eq "LPPandRH") {
        Add-ADGroupMember -Identity "PRINTER" -Members $distinguishedName
    }
    if ($User.printer -eq "LPPandTraceur") {
        Add-ADGroupMember -Identity "PRINTER" -Members $distinguishedName
    }

    $progress = $progress+1
    $pourcentage = [math]::Round($progress/$Users.Length*100,2)
    Write-Progress -Activity "Addition in Progress" -Status "$pourcentage% Complete:" -PercentComplete $pourcentage
}