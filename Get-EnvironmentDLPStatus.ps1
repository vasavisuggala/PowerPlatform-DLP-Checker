# Load Power Platform Admin module  
Import-Module Microsoft.PowerApps.Administration.PowerShell  
  
# Login to Power Platform  
Add-PowerAppsAccount  
  
# Get all environments  
$environments = Get-AdminPowerAppEnvironment  
  
# Get all DLP policies  
$dlpPolicies = Get-AdminDlpPolicy  
  
# Prepare result array  
$result = @()  
  
# Loop through environments  
foreach ($env in $environments) {  
    $envName = $env.DisplayName  
    $envId   = $env.EnvironmentName  
  
    # Find DLP policy assigned to this environment
    $dlpPolicy = $dlpPolicies | Where-Object {  
        $_.Environments.EnvironmentName -contains $envId  
    }  
  
    if ($dlpPolicy) {  
        $dlpName = $dlpPolicy.DisplayName
        $dlpStatus = "✅ DLP Policy Assigned"
    } else {  
        $dlpName = "N/A"  
        $dlpStatus = "❌ No DLP Policy"
    }  
  
    # Add to result array  
    $result += [PSCustomObject]@{  
        EnvironmentName = $envName  
        EnvironmentID   = $envId  
        DLPPolicyName   = $dlpName  
        DLPPolicyStatus = $dlpStatus
    }  
}  
  
# Export results to CSV  
$exportPath = "C:\AllEnvironments-DLP-Policies.csv"  
$result | Export-Csv -Path $exportPath -NoTypeInformation -Encoding UTF8  
  
Write-Host "✅ Exported all environments with their DLP policy and status to $exportPath"  


# Export results to CSV
$exportPath = "C:\AllEnvironments-DLP-Status.csv"
$result | Export-Csv -Path $exportPath -NoTypeInformation -Encoding UTF8

Write-Host "✅ Exported all environments with DLP status to $exportPath" idhi GitHub lo pedatha 
