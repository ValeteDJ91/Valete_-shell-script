$Search = "OU=,OU=,OU=,DC=,DC="
$Bypass = $('')

$users = Get-ADUser -SearchBase $Search -filter *

foreach ($user in $users) {
    if ($Bypass -contains $user.SamAccountName) {continue}
    set-aduser $user -PasswordNeverExpires:$false -ChangePasswordAtLogon:$true
} 