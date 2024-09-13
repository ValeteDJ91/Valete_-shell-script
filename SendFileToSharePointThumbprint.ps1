$SharepointURL = ""
$Tenant = ""
$ClientID = ""
$Thumbprint = ""
$FolderPath = ""
$SharePointPath = ""

Connect-PnPOnline -Tenant $Tenant -ClientId $ClientID -Thumbprint $Thumbprint -Url $SharepointURL

foreach ($file in (Get-ChildItem -Path $FolderPath | where {$_.extension -eq ".csv"})) {
    Add-PnPFile -Folder ($SharepointURL+$SharePointPath) -Path $file.FullName
}