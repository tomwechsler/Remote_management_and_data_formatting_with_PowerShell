#Show the help and alias for Format-Wide
Help Format-Wide
Get-Alias -Definition Format-Wide
cls

#Show the output of format wide, followed by the formatting rule that decides which property to display by default
Get-Process | Format-Wide
Notepad C:\docs\process.xml

# Show autosizing with format wide
Get-Process | Format-Wide -AutoSize

#Show the ability to hard set the columns in the output
Get-Process | Format-Wide -Column 3
Get-Process | Format-Wide -Column 5
Get-Process | Format-Wide -Column 20

#Show the ability to change the property being displayed
Get-Process | Format-Wide -Property Id
Get-Process | Format-Wide -Property Id -Column 4

#Show the grouping capability of format wide
Get-Service | Sort-Object -Property status | Format-Wide -GroupBy Status