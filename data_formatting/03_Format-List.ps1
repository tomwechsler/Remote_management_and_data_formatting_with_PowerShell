#Show the help and alias for Format-List
Help Format-List
Get-Alias -Definition Format-List
cls

#Force the output to a list, show the grouping capability here as well
Get-Process
Get-Process | Format-List
Get-Process | Sort-Object -Property Name | Format-List -GroupBy Name

#Show the ability to view all properties, as well as selected properties
#and the ability to use a custom expression in format cmdlets
Get-Process Winlogon | Format-List
Get-Process Winlogon | Format-List -Property *
Get-Process Winlogon | Format-List Name,Id
Get-Process Winlogon | Format-List @{Name="Process Name";Expression={$_.name}},Id
cls

#Show use of the InputObject paramter, rather than piping to a format cmdlet
$processes = get-process
Format-List -InputObject $processes