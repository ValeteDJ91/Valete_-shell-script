﻿# Not mine
# By Carlos Mercado on Atera

$bootuptime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
$CurrentDate = Get-Date
$uptime = $CurrentDate - $bootuptime

if ($uptime.days -lt 14) {
    return
}

[void][Reflection.Assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089') 
[void][Reflection.Assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089') 
[void][Reflection.Assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a') 
 
$wshell = New-Object -ComObject Wscript.Shell

function Main {  
    Param ([String]$Commandline)  
    
    if((Call-MainForm_psf) -eq 'OK') 
    { 
         
    } 
     
    $global:ExitCode = 0
} 
 
function Call-MainForm_psf 
{ 
 
    [void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089') 
    [void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089') 
    [void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
    [System.Windows.Forms.Application]::EnableVisualStyles() 
    $MainForm = New-Object 'System.Windows.Forms.Form' 
    $panel2 = New-Object 'System.Windows.Forms.Panel' 
    $ButtonPostpone1Hour = New-Object 'System.Windows.Forms.Button' 
    $ButtonRestartNow = New-Object 'System.Windows.Forms.Button' 
    $panel1 = New-Object 'System.Windows.Forms.Panel' 
    $labelITSystemsMaintenance = New-Object 'System.Windows.Forms.Label' 
    $labelSecondsLeftToRestart = New-Object 'System.Windows.Forms.Label' 
    $labelTime = New-Object 'System.Windows.Forms.Label' 
    $labelInOrderToApplySecuri = New-Object 'System.Windows.Forms.Label' 
    $timerUpdate = New-Object 'System.Windows.Forms.Timer' 
    $InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState' 
    $TotalTime = 300
    $MainForm_Load={ 
        $labelTime.Text = "{0:D2}" -f $TotalTime 
        $script:StartTime = (Get-Date).AddSeconds($TotalTime)  
        $timerUpdate.Start() 
    } 
     
    $timerUpdate_Tick={  
        [TimeSpan]$span = $script:StartTime - (Get-Date)
      $hours = "{0:00}" -f $span.Hours
      $mins = "{0:00}" -f $span.Minutes
    $secs = "{0:00}" -f $span.Seconds
    $labelTime.Text = "{0}:{1}:{2}" -f $hours, $mins, $secs
      $timerUpdate.Start()
      if ($span.TotalSeconds -le 0) 
        { 
            $timerUpdate.Stop() 
            Restart-Computer -Force 
        } 
         
    } 
     
    $ButtonRestartNow_Click = { 
        Restart-Computer -Force 
    } 
     
    $ButtonPostpone1Hour_Click={ 
        $MainForm.Close() 
    } 
     
    $labelITSystemsMaintenance_Click={  
         
    } 
     
    $panel2_Paint=[System.Windows.Forms.PaintEventHandler]{ 
         
    } 
     
    $labelTime_Click={ 
         
    } 
       
    $Form_StateCorrection_Load= 
    { 
        $MainForm.WindowState = $InitialFormWindowState 
    } 
     
    $Form_StoreValues_Closing= 
    { 
        #closing action

    } 
 
    $Form_Cleanup_FormClosed= 
    { 
        try 
        { 
            $ButtonPostpone1Hour.remove_Click($ButtonPostpone1Hour_Click) 
            $ButtonRestartNow.remove_Click($ButtonRestartNow_Click) 
            $panel2.remove_Paint($panel2_Paint) 
            $labelITSystemsMaintenance.remove_Click($labelITSystemsMaintenance_Click) 
            $labelTime.remove_Click($labelTime_Click) 
            $MainForm.remove_Load($MainForm_Load) 
            $timerUpdate.remove_Tick($timerUpdate_Tick) 
            $MainForm.remove_Load($Form_StateCorrection_Load) 
            $MainForm.remove_Closing($Form_StoreValues_Closing) 
            $MainForm.remove_FormClosed($Form_Cleanup_FormClosed) 
        } 
        catch [Exception] 
        { } 
    } 
    $MainForm.SuspendLayout() 
    $panel2.SuspendLayout() 
    $panel1.SuspendLayout() 
 
    $MainForm.Controls.Add($panel2) 
    $MainForm.Controls.Add($panel1) 
    $MainForm.Controls.Add($labelSecondsLeftToRestart) 
    $MainForm.Controls.Add($labelTime) 
    $MainForm.Controls.Add($labelInOrderToApplySecuri) 
    $MainForm.AutoScaleDimensions = '6, 13' 
    $MainForm.AutoScaleMode = 'Font' 
    $MainForm.BackColor = 'White' 
    $MainForm.ClientSize = '373, 279' 
    $MainForm.MaximizeBox = $False 
    $MainForm.MinimizeBox = $False 
    $MainForm.Name = 'MainForm' 
    $MainForm.ShowIcon = $False 
    $MainForm.ShowInTaskbar = $False 
    $MainForm.StartPosition = 'CenterScreen' 
    $MainForm.Text = 'Intrapole | Redémarrage system' 
    $MainForm.TopMost = $True 
    $MainForm.add_Load($MainForm_Load) 
    $panel2.Controls.Add($ButtonPostpone1Hour) 
    $panel2.Controls.Add($ButtonRestartNow) 
    $panel2.BackColor = 'ScrollBar' 
    $panel2.Location = '0, 205' 
    $panel2.Name = 'panel2' 
    $panel2.Size = '378, 80' 
    $panel2.TabIndex = 9 
    $panel2.add_Paint($panel2_Paint) 
    $ButtonPostpone1Hour.Font = 'Microsoft Sans Serif, 8.25pt, style=Bold' 
    $ButtonPostpone1Hour.Location = '200, 17' 
    $ButtonPostpone1Hour.Name = 'ButtonPostpone1Hour' 
    $ButtonPostpone1Hour.Size = '150, 45' 
    $ButtonPostpone1Hour.TabIndex = 6 
    $ButtonPostpone1Hour.Text = "Reporter d'une heure" 
    $ButtonPostpone1Hour.UseVisualStyleBackColor = $True 
    $ButtonPostpone1Hour.add_Click($ButtonPostpone1Hour_Click)
    $ButtonRestartNow.Font = 'Microsoft Sans Serif, 8.25pt, style=Bold' 
    $ButtonRestartNow.ForeColor = 'DarkRed' 
    $ButtonRestartNow.Location = '30, 17' 
    $ButtonRestartNow.Name = 'ButtonRestartNow' 
    $ButtonRestartNow.Size = '150, 45' 
    $ButtonRestartNow.TabIndex = 0 
    $ButtonRestartNow.Text = 'Redémarrer maintenant' 
    $ButtonRestartNow.UseVisualStyleBackColor = $True 
    $ButtonRestartNow.add_Click($ButtonRestartNow_Click) 
    $panel1.Controls.Add($labelITSystemsMaintenance) 
    $panel1.BackColor = '0, 114, 198' 
    $panel1.Location = '0, 0' 
    $panel1.Name = 'panel1' 
    $panel1.Size = '375, 67' 
    $panel1.TabIndex = 8 
    $labelITSystemsMaintenance.Font = 'Microsoft Sans Serif, 14.25pt' 
    $labelITSystemsMaintenance.ForeColor = 'White' 
    $labelITSystemsMaintenance.Location = '11, 18' 
    $labelITSystemsMaintenance.Name = 'labelITSystemsMaintenance' 
    $labelITSystemsMaintenance.Size = '269, 23' 
    $labelITSystemsMaintenance.TabIndex = 1 
    $labelITSystemsMaintenance.Text = 'Redémarrage programmé' 
    $labelITSystemsMaintenance.TextAlign = 'MiddleLeft' 
    $labelITSystemsMaintenance.add_Click($labelITSystemsMaintenance_Click)
    $labelSecondsLeftToRestart.AutoSize = $True 
    $labelSecondsLeftToRestart.Font = 'Microsoft Sans Serif, 9pt, style=Bold' 
    $labelSecondsLeftToRestart.Location = '65, 176' 
    $labelSecondsLeftToRestart.Name = 'labelSecondsLeftToRestart' 
    $labelSecondsLeftToRestart.Size = '155, 15' 
    $labelSecondsLeftToRestart.TabIndex = 5 
    $labelSecondsLeftToRestart.Text = 'Temps avant le redémarrage :'
    $labelTime.AutoSize = $True 
    $labelTime.Font = 'Microsoft Sans Serif, 9pt, style=Bold' 
    $labelTime.ForeColor = '192, 0, 0' 
    $labelTime.Location = '250, 176' 
    $labelTime.Name = 'labelTime' 
    $labelTime.Size = '43, 15' 
    $labelTime.TabIndex = 3 
    $labelTime.Text = '00:60' 
    $labelTime.TextAlign = 'MiddleCenter' 
    $labelTime.add_Click($labelTime_Click)
    $labelInOrderToApplySecuri.Font = 'Microsoft Sans Serif, 9pt' 
    $labelInOrderToApplySecuri.Location = '12, 84' 
    $labelInOrderToApplySecuri.Name = 'labelInOrderToApplySecuri' 
    $labelInOrderToApplySecuri.Size = '350, 83' 
    $labelInOrderToApplySecuri.TabIndex = 2 
    $labelInOrderToApplySecuri.Text = "Afin d'appliquer les correctifs de sécurité et les mises à jour pour votre système, votre ordinateur doit être redémarré.
     
Veuillez enregistrer tous vos fichiers maintenant pour éviter la perte de données."
    $timerUpdate.add_Tick($timerUpdate_Tick) 
    $panel1.ResumeLayout() 
    $panel2.ResumeLayout() 
    $MainForm.ResumeLayout() 
    $InitialFormWindowState = $MainForm.WindowState 
    $MainForm.add_Load($Form_StateCorrection_Load) 
    $MainForm.add_FormClosed($Form_Cleanup_FormClosed) 
    $MainForm.add_Closing($Form_StoreValues_Closing) 
    return $MainForm.ShowDialog() 
}

while (1) {
    Main ($CommandLine) 
    Start-Sleep -Seconds 3600
}