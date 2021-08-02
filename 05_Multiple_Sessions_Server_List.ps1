#Establish session to an entire list of devices
$devices = Get-Content -Path C:\listOfServers.txt

#Credentials
$credential = Get-Credential

#Create Session
$multiSession = New-PSSession -ComputerName $devices -Credential $credential

#Get the number of CPUs for each remote device
Invoke-Command -Session $multiSession -ScriptBlock {(Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors}

#Get the amount of RAM for each remote device
Invoke-Command -Session $multiSession -ScriptBlock {Get-CimInstance Win32_OperatingSystem | Measure-Object -Property TotalVisibleMemorySize -Sum | ForEach-Object {[Math]::Round($_.sum/1024/1024)}}