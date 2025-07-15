# Power Platform Environment DLP Status Checker

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue?logo=powershell&logoColor=white)](https://docs.microsoft.com/powershell/)
[![CSV Export](https://img.shields.io/badge/Export-CSV-green)](https://github.com/vasavisuggala/PowerPlatform-DLP-Checker)
[![Author](https://img.shields.io/badge/Author-Vasavi%20Suggala-purple)](https://github.com/vasavisuggala)
[![Stars](https://img.shields.io/github/stars/vasavisuggala/PowerPlatform-DLP-Checker?style=social)](https://github.com/vasavisuggala/PowerPlatform-DLP-Checker/stargazers)

This PowerShell script checks all environments in your Microsoft Power Platform tenant and exports their DLP (Data Loss Prevention) policy status to a CSV file.

## ✅ Features
- Lists all environments  
- Checks if a DLP policy is assigned or not  
- Exports results to `C:\AllEnvironments-DLP-Status.csv`  

## ⚡ Usage 
1. **Install the Power Platform PowerShell module:**
   ```powershell
   Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Force
2. **Login to Power Platform:**
   ```powershell
   Add-PowerAppsAccount
3. **Run the script:**
   ```powershell
   .\Get-EnvironmentDLPStatus.ps1
4. **Check the CSV file at:**
  📂 C:\AllEnvironments-DLP-Status.csv   
5. **Output Example**
   
| EnvironmentName | EnvironmentID | DLPPolicyStatus         |
| ----------------|---------------|-------------------------|
| Default         | Default-12345 | ✅ DLP Policy Assigned |
| Dev             | dev-67890     | ❌ No DLP Policy       |

## 👩‍💻 Author
✍️Developed with ❤️ by ***Vasavi Suggala***

## 🌟 Like this Script?
If you found this script useful, please ⭐ star this repository to support future updates and help others discover it.

