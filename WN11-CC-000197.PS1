<#
.SYNOPSIS
    This PowerShell script Ensure Windows consumer features are disabled (DisableWindowsConsumerFeatures = 1)

.NOTES
    Author          : Monsif Bichara
    LinkedIn        : https://www.linkedin.com/in/monsif-bichara-572124240/
    GitHub          : https://github.com/Cefbic
    Date Created    : 2025-10-20
    Last Modified   : 2025-10-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000197

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  Run this script as Administrator to enforce STIG WN11-CC-000197.
Disables Windows consumer features by setting:
HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent\DisableWindowsConsumerFeatures = 1
No restart is required.
#>



# STIG Fix - WN11-CC-000197
# Ensure Windows consumer features are disabled (DisableWindowsConsumerFeatures = 1)

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$name = "DisableWindowsConsumerFeatures"
$value = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

$current = Get-ItemProperty -Path $regPath -Name $name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $name -ErrorAction SilentlyContinue

if ($current -ne $value) {
    Set-ItemProperty -Path $regPath -Name $name -Value $value -Type DWord
    Write-Output "Set $name to $value under $regPath"
} else {
    Write-Output "$name is already set correctly."
}
