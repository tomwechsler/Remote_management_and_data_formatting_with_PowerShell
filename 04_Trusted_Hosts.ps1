#Creating Trusted Host Entries

#Create using a Command Prompt
winrm set winrm/config/client @{TrustedHosts= "172.16.1.201"}

#Create using PowerShell
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "172.16.1.201" –Force

#Adding Trusted Host Entries using PowerShell
$hosts = (Get-Item -Path WSMan:\localhost\Client\TrustedHosts).Value

#What's in the variable?
$hosts

Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Concatenate 172.16.1.201 -Force