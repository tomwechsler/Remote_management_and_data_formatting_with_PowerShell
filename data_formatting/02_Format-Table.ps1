#Show the help and alias for Format-Table
Help Format-Table
Get-Alias -Definition Format-Table
cls

#Show formatting cmdlets to a table that don't use a table by default
Get-Date
Get-Date | Format-Table
Get-Host
Get-Host | Format-Table
cls

#Show a cmdlet that does format to a table, and that you can select specific properties
Get-Process
Get-Process | Format-Table
Get-Process | Format-Table -Property Name,Responding,Description
cls

#Format cmdlets can group objects, but should be sorted first
Get-Help Format-Table -Parameter GroupBy
Get-Process | Sort-Object -Property ProcessName | Format-Table -GroupBy ProcessName
Get-Process | Sort-Object -Property ProcessName | Format-Table -GroupBy ProcessName -Property Name,Responding,Description
cls

#When outputting to a table, autosizing and wrapping the text might be required to get a nice looking output
Get-WinEvent -LogName Application -MaxEvents 5
Get-WinEvent -LogName Application -MaxEvents 5 | Format-Table -AutoSize
Get-WinEvent -LogName Application -MaxEvents 5 | Format-Table -Autosize -Wrap
cls

#The RepeatHeader parameter can be useful when piping to the more command
Get-Process | Format-Table -RepeatHeader
Get-Process | Format-Table -RepeatHeader | more
cls

#You can also hide the table headers in a table view
Get-Process | Format-Table -HideTableHeaders