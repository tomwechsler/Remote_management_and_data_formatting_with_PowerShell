#Implicit remoting
$adsess = New-PSSession -ComputerName dc01

#Import Module
Import-Module -Name ActiveDirectory -PSSession $adsess

#Type different from the type on the actual DC
Get-Module #type different from the type on the actual DC

#Functions instead of cmdlets
Get-Command -Module ActiveDirectory 

#Let's check
Get-ADUser -Filter *

#Infos
$c = Get-Command Get-ADUser

#Definition
$c.Definition

#Remove module
Remove-Module ActiveDirectory