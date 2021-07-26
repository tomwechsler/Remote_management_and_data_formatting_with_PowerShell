#Verify that WinRM is setup and configured locally
Test-WSMan

#Basic WinRM configuration with default settings
winrm quickconfig

#Example of WinRM configuration with more specific settings
winrm quickconfig -transport:https

#Enable over HTTP
Set-WSManQuickConfig

#Enable over HTTPS
Set-WSManQuickConfig –UseSSL

#Enable Remoting
Enable-PSRemoting –Force

#Enable Remoting with no Network Profile Check
Enable-PSRemoting -Force -SkipNetworkProfileCheck

#Check winrm settings
winrm get winrm/config/client
winrm get winrm/config/service

PS C:\> winrm enumerate winrm/config/listener
Listener
    Address = *
    Transport = HTTP
    Port = 5985
    Hostname
    Enabled = true
    URLPrefix = wsman
    CertificateThumbprint
    ListeningOn = 10.0.3.253, 127.0.0.1, 192.168.1.253, ::1,

#Verify that WinRM is setup and responding on a remote device
#you must specify the authentication type when testing a remote device.
#if you are unsure about the authentication, set it to Negotiate
$credential = Get-Credential
Test-WSMan RemoteDeviceName -Authentication Negotiate -Credential $credential

#Verify local device is listening on WinRM port
Get-NetTCPConnection -LocalPort 5985

#Verify a remote device is listening on WinRM port
Test-NetConnection -Computername 192.168.34.13 -Port 5985
