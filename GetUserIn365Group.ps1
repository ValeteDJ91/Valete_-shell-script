Get-DistributionGroupMember -Identity "GroupName"  | ForEach-Object {
       New-Object -TypeName PSObject -Property @{
       Group = $group.DisplayName
       Member = $_.Name
       EmailAddress = $_.PrimarySMTPAddress
       RecipientType= $_.RecipientType
}} | Export-CSV "C:\Office365GroupMembers.csv" -NoTypeInformation -Encoding UTF8