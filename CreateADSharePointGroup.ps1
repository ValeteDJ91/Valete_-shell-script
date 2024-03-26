#$ous = Get-ADOrganizationalUnit -LDAPFilter '(name=*)' -SearchBase 'OU=,OU=,DC=,DC=,DC=' -SearchScope OneLevel
$ous = Get-ADOrganizationalUnit -LDAPFilter '(name=*)' -SearchBase 'OU=,OU=,DC=,DC=,DC=' -SearchScope Subtree

foreach ($ou in $ous) {
    Write-Host 'Creating groups for:' $ou.Name
    Try {
        New-ADGroup -Name ($ou.Name + "-RO") -GroupCategory Security -GroupScope Global -Path $ou.DistinguishedName -Description "Lecture seule"
        New-ADGroup -Name ($ou.Name + "-RW") -GroupCategory Security -GroupScope Global -Path $ou.DistinguishedName -Description "Lecture écriture"
        New-ADGroup -Name ($ou.Name + "-RWD") -GroupCategory Security -GroupScope Global -Path $ou.DistinguishedName -Description "Lecture écriture suppression"
    } Catch [Microsoft.ActiveDirectory.Management.ADException] {
        Write-Host 'Group already exists !'
    }
}

