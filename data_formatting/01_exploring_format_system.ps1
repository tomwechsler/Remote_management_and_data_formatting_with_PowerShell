#Work with a string, note that it doesn't get formatted to a table or a list, it is being sent directly to out-host
$mystring = "This is a string of text. Nothing too exciting."
$mystring | Get-Member
$mystring
$mystring | Format-Table
$mystring | Format-List
cls

#Note that you can pipe cmdlets to Out-Default and Out-Host if you want to use their paramters, but the output is the same
Get-NetAdapter
Get-NetAdapter | Out-Default
Get-NetAdapter | Out-Default | Out-Host
cls


#Get the object type for a process
Get-Process
Get-Process | Get-Member | more

#Explore the format constructs in PowerShell 7
Get-FormatData
Get-FormatData -TypeName System.Diagnostics.Process -PowerShellVersion 5.1
$formatdata = Get-FormatData -TypeName System.Diagnostics.Process -PowerShellVersion 5.1
$formatdata.FormatViewDefinition
$formatdata.FormatViewDefinition[0].Control
$formatdata.FormatViewDefinition[0].Control.Headers

#Create a new directory and output the formatting instructions for process objects to an XML file
New-item C:\Docs -ItemType Directory
Get-FormatData -TypeName System.Diagnostics.Process -PowerShellVersion 5.1 | Export-FormatData -Path C:\docs\process.xml -IncludeScriptBlock
Notepad C:\docs\process.xml
cls

#Show that when 5 or more properties are selected, it will format to a list, but with 4 or fewer, it will format to table
Test-NetConnection -ComputerName www.google.com -CommonTCPPort HTTP
Test-NetConnection -ComputerName www.google.com -CommonTCPPort HTTP | Get-Member
Test-NetConnection -ComputerName www.google.com -CommonTCPPort HTTP | Select-Object ComputerName,RemoteAddress,RemotePort,SourceAddress
Test-NetConnection -ComputerName www.google.com -CommonTCPPort HTTP | Select-Object ComputerName,RemoteAddress,RemotePort,SourceAddress,PingSucceeded
Test-NetConnection -ComputerName www.google.com -CommonTCPPort HTTP | Select-Object ComputerName,RemoteAddress,RemotePort,SourceAddress,PingSucceeded | Format-Table
