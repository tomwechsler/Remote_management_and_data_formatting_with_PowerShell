#Creating PSCredential Object using Get-Credential
$creds = Get-Credential 

$creds = Get-Credential –Credential "admin"

#Create a Session
Enter-PSSession -ComputerName 172.16.1.202 -Credential $creds

#Create PSCredentialfrom Username and Secure Password
$user = "admin"
$pwd = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force

$creds = New-Object System.Management.Automation.PSCredential($user, $pwd)

#Create a Session
Enter-PSSession -ComputerName 172.16.1.202 -Credential $creds

$creds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user,$pwd

#Create a Session
Enter-PSSession -ComputerName 172.16.1.202 -Credential $creds