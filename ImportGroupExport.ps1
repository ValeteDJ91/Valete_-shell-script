$groups = Get-ChildItem -Path "C:\group_export" -File
$Search = "OU=,OU=,DC=,DC=,DC="

foreach ($group in $groups) {
    Write-host "Processing group: " $group.Basename
    try {
        Get-ADGroup -Filter "Name -like '$($group.Basename)'" -SearchBase $Search
    } catch {
        Write-host "Can't find group: " $group.Basename
        continue
    }
    $fileUsers = Get-Content $group.FullName
    #Add-ADGroupMember -Identity $groupName -Members $fileUsers
}

