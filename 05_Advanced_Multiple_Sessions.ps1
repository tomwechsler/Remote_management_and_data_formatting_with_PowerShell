Set-Location C:\
Clear-Host

#Declare servers we will connect to remotely
$servers = (Get-ADComputer -Filter *).Name

#Capture credentials used for remote access
$creds = Get-Credential

#Declare array to hold remote command results
$remoteResults = @()

#Declare a splat for our Invoke-Command parameters
$invokeSplat = @{
    ComputerName  = $servers
    Credential    = $creds
    ErrorVariable = 'connectErrors'
    ErrorAction   = 'SilentlyContinue'
}

#Execute remote command with splatted parameters.
#Store results in variable
#Errors will be stored in connectErrors
$remoteResults = Invoke-Command @invokeSplat -ScriptBlock {
    #declare a custom object to store result in and return
    $obj = [PSCustomObject]@{
        Name      = $env:COMPUTERNAME
        CPUs      = "-------"
        Memory    = "-------"
        FreeSpace = "-------"
    }
    #Retrieve the CPU / Memory / Hard Drive information
    $obj.CPUs = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors
    $obj.Memory = Get-CimInstance Win32_OperatingSystem `
        | Measure-Object -Property TotalVisibleMemorySize -Sum `
        | ForEach-Object { [Math]::Round($_.sum / 1024 / 1024) }
    $driveData = Get-PSDrive C | Select-Object Used, Free
    $total = $driveData.Used + $driveData.Free
    $calc = [Math]::Round($driveData.Free / $total, 2)
    $obj.FreeSpace = $calc * 100
    return $obj
}

#Capture any connection errors
$remoteFailures = $connectErrors.CategoryInfo `
    | Where-Object {$_.Reason -eq 'PSRemotingTransportException'} `
    | Select-Object TargetName,@{n = 'ErrorInfo'; E = {$_.Reason} }

#Check the results
$remoteResults | Out-GridView

#Any error's?
$remoteFailures