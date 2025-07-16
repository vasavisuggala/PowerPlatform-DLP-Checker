# Power Platform Environment DLP Status Checker

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue?logo=powershell&logoColor=white)](https://docs.microsoft.com/powershell/)
[![CSV Export](https://img.shields.io/badge/Export-CSV-green)](https://github.com/vasavisuggala/PowerPlatform-DLP-Checker)
[![Author](https://img.shields.io/badge/Author-Vasavi%20Suggala-purple)](https://github.com/vasavisuggala)
[![Stars](https://img.shields.io/github/stars/vasavisuggala/PowerPlatform-DLP-Checker?style=social)](https://github.com/vasavisuggala/PowerPlatform-DLP-Checker/stargazers)

This PowerShell script helps Power Platform administrators check which environments are assigned to which Data Loss Prevention (DLP) policies in their tenant.
It retrieves all environments and DLP policies, maps their relationships, and exports the results to a CSV file for easy review.

## 🧑‍💻 What Does This Script Do?
- ✅ Logs into the Power Platform admin account.
- ✅ Fetches all environments in the tenant.
- ✅ Retrieves all DLP policies configured in the tenant.
- ✅ Checks which environment is assigned to which DLP policy.
- ✅ Exports the results to a CSV file `C:\AllEnvironments-DLP-Status.csv`.

## This is especially useful for:
- 📊 Auditing environments without DLP policies.
- 🛡️ Ensuring compliance and governance.
- 📂 Creating reports for management or security teams.

## 📂 Output
The script creates a CSV file like this:

| EnvironmentName  | EnvironmentGUID   | DLPPolicyName | DLPPolicyID | DLPPolicyStatus           |
| ---------------- | ----------------- | ------------- | ----------- | ------------------------- |
| Dev Environment  | 12345-abcde-67890 | Policy-Dev    | DLP001      | ✅ DLP Policy Assigned    |
| Test Environment | 98765-zyxwv-43210 | N/A           | N/A         | ❌ No DLP Policy Assigned |

- ✅ Indicates the environment has a DLP policy.
- ❌ Indicates the environment is not assigned to any DLP policy.

## 📥 How to Use
1. **Install the Power Platform Admin module (if not already installed):**
   ```powershell
   Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Scope CurrentUser
2. Clone or download this repository.
3.**Run the script:**
   ```powershell
   .\Get-EnvironmentDLPStatus.ps1
4. **Login to Power Platform:**
   ```powershell
   Add-PowerAppsAccount
6. **Find the exported CSV file at:**
  📂 C:\AllEnvironments-DLP-Status.csv

## ⚠️ Prerequisites
- PowerShell 5.1+ or PowerShell Core.
- Admin access to Power Platform.
- Installed *Microsoft.PowerApps.Administration.PowerShell* module.
  
## 📌 Why Use This?
- ✅ Quickly audit environments.
- ✅ Detect missing DLP policies.
- ✅ Improve security posture.

## 👩‍💻 Author
✍️Developed with ❤️ by ***Vasavi Suggala***

## 🌟 Like this Script?
If you found this script useful, please ⭐ star this repository to support future updates and help others discover it.

