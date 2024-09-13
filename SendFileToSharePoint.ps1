$SharepointURL = ""
$UserName=""
$Password = ""
$FolderPath = ""
$SharePointPath = ""
 
$SecurePassword = ConvertTo-SecureString -String $Password -AsPlainText -Force
$Cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $UserName, $SecurePassword

Connect-PnPOnline -Url $SharepointURL -Credentials $Cred

foreach ($file in (Get-ChildItem -Path $FolderPath | where {$_.extension -eq ".csv"})) {
    Add-PnPFile -Folder ($SharepointURL+$SharePointPath) -Path $file.FullName
}