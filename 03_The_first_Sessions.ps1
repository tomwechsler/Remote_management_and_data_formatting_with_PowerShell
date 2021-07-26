Set-Location C:\
Clear-Host

#A first remote session (not permanent)
Invoke-Command -ComputerName dc01 {$env:computername}
Invoke-Command -ComputerName dc02 {$var=10}
Invoke-Command -ComputerName dc02 {$var}

#Filter on remote and perform actions or strange results
Invoke-Command -ComputerName dc01 -ScriptBlock {Get-EventLog -LogName security} | Select-Object -First 10
Invoke-command -computername dc01 -ScriptBlock {Get-EventLog -LogName security | Select-Object -First 10}
Invoke-command -ComputerName dc01 -ScriptBlock {Get-EventLog -LogName security -Newest 10}

Invoke-Command -ComputerName dc01 -ScriptBlock {Get-Process} | where {$_.name -eq "notepad"} | Stop-Process #Error
Invoke-Command -ComputerName dc01 -ScriptBlock {Get-Process | where {$_.name -eq "notepad"} | Stop-Process }

Measure-Command {Invoke-Command -ComputerName dc01 -ScriptBlock {Get-Process} | where {$_.name -eq "notepad"}}
Measure-Command {Invoke-Command -ComputerName dc01 -ScriptBlock {Get-Process | where {$_.name -eq "notepad"}}}

#Session
$session = New-PSSession -ComputerName dc02

#Commands
Invoke-Command -Session $session {$var=10}
Invoke-Command -Session $session {$var}
Invoke-Command -Session $session {Get-ComputerInfo}

#Using Interactive Sessions

#Connect to a PowerShell Session on the specified Computer
Enter-PSSession -ComputerName dc01

#Hostname from remote system
hostname

#Exit
exit

#Take a look
Get-PSSession

#Create a New PowerShell Session on the specified Computer
New-PSSession -ComputerName dc01

#Create a Persistent PowerShell Session on the specified Computer
$ps = New-PSSession -ComputerName dc01

#Connect to PowerShell Session on the specified Computer, use Port and Credential
Enter-PSSession -ComputerName dc01 -Port 99 -Credential "Zodiac\user"

#Remove a PowerShell Session
$ps = Get-PSSession
Remove-PSSession -Session $ps

#Create Session Options

#Create Default Session Options
Get-Help New-PSSessionOption

New-PSSessionOption

#Define the Session Options
$options= New-PSSessionOption 
$options.OpenTimeout = (New-Timespan-Minutes 4)
$options.NoEncryption = $true
$options.UICulture = (Get-UICulture)

#Create PowerShell Session using the created Session Options
New-PSSession -ComputerName dc01 -SessionOption $options

#Create PowerShell Session
$session = New-PSSession -ComputerName dc01

#Get the number of CPUs from a remote device
Invoke-Command -Session $session -ScriptBlock {(Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors}

#Get the amount of RAM from a remote device
Invoke-Command -Session $session -ScriptBlock {Get-CimInstance Win32_OperatingSystem | Measure-Object -Property TotalVisibleMemorySize -Sum | ForEach-Object {[Math]::Round($_.sum/1024/1024)}}

#Get the amount of free space on the C: drive from a remote device
Invoke-Command -Session $session -ScriptBlock {
    $driveData = Get-PSDrive C | Select-Object Used,Free
    $total = $driveData.Used + $driveData.Free
    $calc = [Math]::Round($driveData.Free / $total,2)
    $perFree = $calc * 100
    return $perFree
}