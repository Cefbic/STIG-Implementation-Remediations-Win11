<#
.SYNOPSIS
    This PowerShell script Ensure elevated Windows Installer use is disabled (AlwaysInstallElevated = 0)
.NOTES
    Author          : Monsif Bichara
    LinkedIn        : https://www.linkedin.com/in/monsif-bichara-572124240/
    GitHub          : https://github.com/Cefbic
    Date Created    : 2025-10-19
    Last Modified   : 2025-10-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  Run this script as Administrator to enforce STIG WN11-CC-000315.
Disables elevated privilege installations via Windows Installer by setting:
HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated = 0
No reboot required.
#>

# STIG Fix - WN11-CC-000315
# Ensure elevated Windows Installer use is disabled (AlwaysInstallElevated = 0)

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$name = "AlwaysInstallElevated"
$value = 0

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
