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

    # Check if any DLP policy is assigned
    $dlp = $dlpPolicies | Where-Object {
        $_.Environments.EnvironmentName -contains $envId
    }

    $dlpStatus = if ($dlp) { "✅ DLP Policy Assigned" } else { "❌ No DLP Policy" }

    # Add to result array
    $result += [PSCustomObject]@{
        EnvironmentName = $envName
        EnvironmentID   = $envId
        DLPPolicyStatus = $dlpStatus
    }
}

# Export results to CSV
$exportPath = "C:\AllEnvironments-DLP-Status.csv"
$result | Export-Csv -Path $exportPath -NoTypeInformation -Encoding UTF8

Write-Host "✅ Exported all environments with DLP status to $exportPath" idhi GitHub lo pedatha 