$names = Import-Csv -Path c:\structurereseau.csv

Function GetFolders($folderUrl) {
    $folderColl = Get-PnPFolderItem -FolderSiteRelativeUrl $folderUrl -ItemType Folder

    foreach($folder in $folderColl) {
        if ($folder.Name -contains 'forms') {continue}

        $newFolderURL = $folderUrl+"/"+$folder.Name
        $adname = $names.where({$_.originalname -eq $folder.Name}).adname
        write-host $newFolderURL '|' $folder.Name '->' $adname
        
        #echo ('Adding group ' + $adname + '-RO')
        #Set-PnPFolderPermission -List 'Documents partages' -Identity $newFolderURL.TrimStart("/") -User ($adname + '-RO') -AddRole 'Lecture'
        #echo ('Adding group ' + $adname + '-RW')
        #Set-PnPFolderPermission -List 'Documents partages' -Identity $newFolderURL.TrimStart("/") -User ($adname + '-RW') -AddRole 'Modification'
        #echo ('Adding group ' + $adname + '-RWD')
        #Set-PnPFolderPermission -List 'Documents partages' -Identity $newFolderURL.TrimStart("/") -User ($adname + '-RWD') -AddRole 'Collaboration'
        
        echo ('Clearing groups ' + $name.adname)
        Set-PnPFolderPermission -List 'Documents partages' -Identity $newFolderURL.TrimStart("/") -User 'Dyn_All_Users' -RemoveRole 'Lecture'

        GetFolders($newFolderURL)
    }
}

Connect-PnPOnline -URL 'https://adionics1.sharepoint.com/sites/Adionics' -UseWebLogin

GetFolders('/Documents partages')

#echo get-pnproledefinition
