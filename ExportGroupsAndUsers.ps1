$Search = "OU=ALIVE,OU=BUSINESS,DC=A,DC=D,DC=F"
#$Search = "OU=Droits,DC=phiapagroup,DC=local"

Remove-Item 'c:\group_export' -Recurse -Force -Confirm:$false
Start-Sleep -Milliseconds 1000
New-Item -ItemType Directory -Force -Path 'c:\group_export'

$groups = get-adgroup -filter * -SearchBase $Search

foreach ($group in $groups) {
    if ($group.Name -like '*PRT*') {continue}
    Write-Host 'Getting info for group:' $group.Name
    $export_file = "c:\group_export\"+$group.Name+".txt"
    
    $users = (Get-ADGroup -Filter "Name -like '$($group.Name)'" -SearchBase $Search -Properties member).member
    foreach ($dnuser in $users) {
        try {
            $user = Get-ADUser -Identity $dnuser
        } catch {continue}
        if ($user.distinguishedName -like '*OU=Users*') {continue}
        $user.SamAccountName >> $export_file
    }
}