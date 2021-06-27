#Enable PowerShell Remoting using WS-MAN

#Enable over HTTP
Set-WSManQuickConfig

#Enable over HTTPS
Set-WSManQuickConfig –UseSSL
#Enable Remoting
Enable-PSRemoting –Force

#Enable Remoting with no Network Profile Check
Enable-PSRemoting -Force -SkipNetworkProfileCheck

#Prepare Windows 10 for SSH Remoting

#Install OpenSSH Client and Server
Add-WindowsCapability-Online -Name OpenSSH.ClientAdd-WindowsCapability-Online -Name OpenSSH.Server

#Set the SSH Server Service to start Automatically
Set-Service-Name sshd-StartupType"Automatic"
Start-Service-Name sshd

#Install and Import Microsoft's PowerShell Remoting Module
Install-Module-Name Microsoft.PowerShell.RemotingTools
Import-Module-Name Microsoft.PowerShell.RemotingTools

#Enable SSH Remoting and Restart the Service
Enable-SSHRemoting–Verbose
Restart-Service-Name sshd