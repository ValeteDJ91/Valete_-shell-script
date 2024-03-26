Install-Module PSWindowsUpdate -Force
Set-ExecutionPolicy Unrestricted
Get-WindowsUpdate
Install-WindowsUpdate -AcceptAll –IgnoreReboot