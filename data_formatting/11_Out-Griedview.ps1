#Show the help for Out-Gridview
Help out-gridview

#Send processes to Out-Gridview and explore the user interface
Get-Process | Out-Gridview

#Send selected properties to out gridview
Get-Process | Select Name,Id | Out-Gridview

#Send all properties to out gridview
Get-Process | Select * | Out-Gridview

#Show usage of the passthru paramter to send selected data from out-gridview down the pipeline
Get-process | Select Name,Id | Out-GridView -Title MyData -Passthru | export-csv C:\Docs\Process.csv -NoTypeInformation

#Show that out gridview does not work with formatted data
Get-Process | format-list | out-gridview
cls

#Show a different tool which is similar, called out-consolegridview
Install-Module Microsoft.PowerShell.ConsoleGuiTools
Get-Command -Module Microsoft.PowerShell.ConsoleGuiTools
Get-Process | Out-ConsoleGridView
Get-Process | Out-ConsoleGridView -Filter svc
Get-Process | Out-ConsoleGridView -Title MyGridView
Get-Process | Out-ConsoleGridView -OutputMode -Single