# This script is used to install the web server IIS if it is not installed on server

#region start timer
$startTime = Get-Date
Write-Output "SCRIPT START - $startTime"
#endregion

try {
    if ((Get-WindowsFeature Web-Server).InstallState -eq "Installed") {
        Write-Host "IIS is installed on server"
    } 
    else {
        Write-Host "IIS is not installed on server"

        #region IIS instalation
        $iisStartTime = Get-Date
        Write-Host "$iisStartTime - IIS installation started"

        Install-WindowsFeature -name Web-Server -IncludeManagementTools -IncludeAllSubFeature

        $iisFinsihedTime = Get-Date
        Write-Host "$iisFinsihedTime - IIS installation finished"
        #endregion IIS instalation
    }
}
catch {
    $errorMessage = $_.Exception.Message
    Write-Error "Uexpected error with IIS cehck/instalation. $errorMessage"
    throw $_
}


#region start timer
$endTime = Get-Date
Write-Output "SCRIPT FINISHED - $endTime"
#endregion
