#Multiple machines
$dcs = "dc01","dc02"

#Let's run
Invoke-Command -ComputerName $dcs -ScriptBlock {$env:computername}

#Create a variable
$sessions = New-PSSession -ComputerName $dcs

#Whats in the variable
$sessions

#Run the command
Invoke-Command -Session $sessions -ScriptBlock {$env:computername}

#Remove the sessions
Get-PSSession | Remove-PSSession 

#Create Multiple Remote Sessions into Variables
$dc01, $dc02 = New-PSSession -ComputerName "dc01","dc02"

#Let's check
Get-PSSession

#Run the command
Invoke-Command -Session $dc01 -ScriptBlock {$env:computername}

#Get the sessions
Get-PSSession

#Remove a session
Remove-PSSession -Id 69