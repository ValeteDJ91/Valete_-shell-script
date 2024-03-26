$perms = Import-Csv -Path C:\perms.csv

foreach($perm in $perms) {

    Write-Host ''
    Write-Host '==============================='
    Write-Host 'Adding users to:' $perm.adname
    
    Write-Host 'Adding RWD'
    $users = $perm.RWD -split '_'
    foreach ($user in $users) {
        if ($user -eq '') {continue}
        $username = '*' + $user + '*'
        $currentuser = Get-ADUser -filter {Name -like $username}
        if ($currentuser) {
            $groupname = $perm.adname + '-RWD'
            Add-ADGroupMember -Identity $groupname -Members $currentuser.SamAccountName
        } else {
            Write-Host -ForegroundColor Red 'No user found for' $groupname
            echo $user
        }
    }
    
    Write-Host 'Adding RW'
    $users = $perm.RW -split '_'
    foreach ($user in $users) {
        if ($user -eq '') {continue}
        $username = '*' + $user + '*'
        $currentuser = Get-ADUser -filter {Name -like $username}
        if ($currentuser) {
            $groupname = $perm.adname + '-RW'
            Add-ADGroupMember -Identity $groupname -Members $currentuser.SamAccountName
        } else {
            Write-Host -ForegroundColor Red 'No user found for' $groupname
            echo $user
        }
    }
    
    Write-Host 'Adding RO'
    $users = $perm.RO -split '_'
    foreach ($user in $users) {
        if ($user -eq '') {continue}
        $username = '*' + $user + '*'
        $currentuser = Get-ADUser -filter {Name -like $username}
        if ($currentuser) {
            $groupname = $perm.adname + '-RO'
            Add-ADGroupMember -Identity $groupname -Members $currentuser.SamAccountName
        } else {
            Write-Host -ForegroundColor Red 'No user found for' $groupname
            echo $user
        }
    }

}