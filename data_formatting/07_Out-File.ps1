#Show the help for Out-File
Help out-file

#Export data to a file using out-file
Get-Process s* | Out-File -FilePath C:\Docs\process.txt
Notepad C:\Docs\process.txt

#Formatted data can be export as well
Get-Process s* | Format-List | Out-File C:\Docs\process.txt
Notepad C:\Docs\process.txt

#No Clobber will stop files being overwritten
Get-Process s* | Out-File C:\Docs\process.txt -NoClobber

#Use the Append Parameter to append data to the file rather than overwrite
Get-Process s* | Out-File C:\Docs\process.txt -Append
Notepad C:\Docs\process.txt

#The NoNewLine paramter can be used to output all data on a single line
Get-Process s* | Out-File C:\Docs\process.txt -NoNewLine
Notepad C:\Docs\process.txt

#The Width parameter controls the number of text columns to export to the file
Get-Process s* | Out-File C:\Docs\process.txt -Width 20
Notepad C:\Docs\process.txt

#You can use the InputObject parameter to speficy the data to work with
$Processes = get-process s*
Out-File -InputObject $processes -FilePath C:\Docs\process.txt
Notepad C:\Docs\process.txt

#Show the object type being sent down the pipeline
Get-Process s* | Out-File C:\Docs\process.txt | Get-Member

#In addition to out-file, there are redirection operators that can be used to output data from PowerShell to a text file
Help about_redirection
Get-Process > C:\Docs\process.txt
Notepad C:\Docs\process.txt
Get-Process >> C:\Docs\process.txt
Notepad C:\Docs\process.txt