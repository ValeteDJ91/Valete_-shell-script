Remove-Item 'c:\prt-dump' -Recurse -Force -Confirm:$false
New-Item -ItemType Directory -Force -Path 'c:\prt-dump'

$groups = Get-ADGroup -Filter 'Name -like "PRT-*"'

foreach ($group in $groups) {
    Write-Host 'Dumping users from: ' $group.Name
    $prtusers = Get-ADGroupMember $group.Name
    $prtusersname = $prtusers | % { $_.SamAccountName }
    $filename = 'c:\prt-dump\' + $group.Name + '.txt'
    echo 'Saving user list to: ' $filename
    echo $prtusersname > $filename
}