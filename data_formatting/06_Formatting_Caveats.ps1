#Format cmdlets should be at the end of the pipeline. Both of these won't work
Get-Process | Format-List | select name,id
Get-Process | Format-List | Sort-Object Name

#Pipe to get member to see what object is coming down the pipeline
Get-Process | Get-Member | more
Get-Process | Format-List | Get-Member

#Move the format cmdlet to the end of the pipeline, and show that the only cmdlets to come after format cmdlets, are out cmdlets
Get-Process | Select Name,Id | Format-List
Get-Process | Select Name,Id | Format-List | Out-File C:\docs\processes.txt
Get-content C:\docs\processes.txt

#The exception is out-gridview, which doesn't accept formatted data, it is expecting raw objects
Get-Process | Select Name,Id | Format-List | Out-GridView
Get-Process | Select Name,Id | Out-GridView