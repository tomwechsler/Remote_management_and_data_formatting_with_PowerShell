#Retrieve the format data again to explore the views
Get-FormatData -TypeName System.Diagnostics.Process -PowerShellVersion 5.1
(Get-FormatData -TypeName System.Diagnostics.Process -PowerShellVersion 5.1).FormatViewDefinition

#Open the exported format data for processes from a previous clip to reivew the different views
Notepad C:\docs\process.xml

#Use the view paramter to have the format cmdlet format as per the view
Get-process | Format-Table -View StartTime
Get-Process | Sort StartTime | ft -View StartTime

#Enter a fake name for the view to get the PowerShell error to tell you which view names are valid for the object type
Get-Process | Format-Table -View a