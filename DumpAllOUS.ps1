$ous = Get-ADOrganizationalUnit -LDAPFilter '(name=*)' -SearchBase 'OU=,OU=,DC=,DC=,DC=' -SearchScope OneLevel
$ous += Get-ADOrganizationalUnit -LDAPFilter '(name=*)' -SearchBase 'OU=,OU=,DC=,DC=,DC=' -SearchScope Subtree

$ousname = $ous | % { $_.Name }

echo $ousname > 'c:\dump.txt'