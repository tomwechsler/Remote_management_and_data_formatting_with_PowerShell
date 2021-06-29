Set-Location C:\
Clear-Host

#Creating PSCredential Object using Get-Credential
$creds = Get-Credential 
$creds = Get-Credential –Credential "zodiac\administrator"

#Create PSCredential from Username and Secure Password
$user = "zodiac\administrator"
$pwd = ConvertTo-SecureString "Password" -AsPlainText-Force

$creds = New-ObjectSystem.Management.Automation.PSCredential($user, $pwd)

$creds = New-Object -TypeName System.Management.Automation.PSCredential`-ArgumentList $user,$pwd


#Create a Session Using Invoke-Command

#Execute a Command on a Remote Computer
Invoke-Command -ComputerName "dc01" -ScriptBlock { Get-ComputerInfo }

#Execute a Script on a Remote Computer
Invoke-Command -ComputerName "dc01" -FilePath "C:\Scripts\Script.ps1"

#Create Persistent Connection and Execute Command
$ps = New-PSSession -ComputerName "dc01"

Invoke-Command -Session $ps { Get-ComputerInfo }

Get-PSSession

#Using Interactive Sessions

#Connect to a PowerShell Session on the specified Computer
Enter-PSSession -ComputerName "dc01"

#Create a New PowerShell Session on the specified Computer
New-PSSession -ComputerName "dc01"

#Create a Persistent PowerShell Session on the specified Computer
$ps = New-PSSession -ComputerName "dc01"

Get-PSSession

#Connect to PowerShell Session on the specified Computer, use Port and Credential
Enter-PSSession -ComputerName "dc01" -Port 99 -Credential "Zodiac\user"

#Remove a PowerShell Session
$ps = Get-PSSession
Remove-PSSession -Session $ps

#Create Session Options

#Create Default Session Options
New-PSSessionOption

#Define the Session Options
$options= New-PSSessionOption 
$options.OpenTimeout = (New-Timespan-Minutes 4)
$options.NoEncryption = $true
$options.UICulture = (Get-UICulture)

#Create PowerShell Session using the created Session Options
New-PSSession -ComputerName "dc01" -SessionOption $options