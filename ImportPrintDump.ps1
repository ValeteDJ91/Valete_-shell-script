$printers = Get-ChildItem "C:\prt-dump" -Filter *.txt

Foreach ($printer in $printers) {
    $printername = $printer.Name.replace('.txt', '') 
    echo 'Adding users from:' $printername
    $file = "C:\prt-dump\" + $printer.Name
    $content = Get-Content $file
    $index = 0
    foreach ($user in $content) {
        $index += 1
        Write-Host $index ' : ' $user
        Add-ADGroupMember -Identity $printername -Members $user
    }
}