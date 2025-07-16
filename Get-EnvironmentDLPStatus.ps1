# ---------------------------------------------
# Power Platform Environment DLP Status Checker
# ---------------------------------------------
# Author    : Vasavi Suggala
# Version   : 1.1
# Purpose   : Export all environments with their DLP policies
# Output    : C:\Users\<User>\Downloads\Policy.csv
# ---------------------------------------------

# Load Power Platform Admin module
Import-Module Microsoft.PowerApps.Administration.PowerShell

# Login to Power Platform
Add-PowerAppsAccount

# Get all environments
$allEnvironments = Get-AdminPowerAppEnvironment
Write-Host "🌐 Total Environments Fetched: $($allEnvironments.Count)"

# Get all DLP policies
$dlpPolicies = @(Get-DlpPolicy | ForEach-Object { $_.PSObject.Properties.Value })
Write-Host "📄 Total DLP Policies Fetched: $($dlpPolicies.Count)"

# Prepare array for export
$results = @()

foreach ($env in $allEnvironments) {
    $envName = $env.DisplayName
    $envGUID = $env.EnvironmentName  # GUID

    # Default status
    $dlpPolicyName = "N/A"
    $dlpPolicyID   = "N/A"
    $dlpStatus     = "❌ No DLP Policy Assigned"

    # Check if environment GUID exists in any DLP policy
    foreach ($policy in $dlpPolicies) {
        $policyEnvGuids = $policy.environments.name
        if ($policyEnvGuids -contains $envGUID) {
            $dlpPolicyName = $policy.DisplayName
            $dlpPolicyID   = $policy.PolicyName
            $dlpStatus     = "✅ DLP Policy Assigned"
            break
        }
    }

    # Add to results
    $results += [PSCustomObject]@{
        EnvironmentName  = $envName
        EnvironmentGUID  = $envGUID
        DLPPolicyName    = ($dlpPolicyName -join ", ")
        DLPPolicyID      = $dlpPolicyID
        DLPPolicyStatus  = $dlpStatus
    }
}
# Export to CSV
$exportPath = "C:\Users\<YourUsername>\Downloads\Policy.csv"
$results | Export-Csv -Path $exportPath -NoTypeInformation -Encoding UTF8

Write-Host "`n✅ Exported all environments with their DLP policies to $exportPath" -ForegroundColor Green

