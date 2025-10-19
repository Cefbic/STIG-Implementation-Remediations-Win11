<#
.SYNOPSIS
    This PowerShell script Ensure WinRM client does not use Digest authentication

.NOTES
    Author          : Monsif Bichara
    LinkedIn        : https://www.linkedin.com/in/monsif-bichara-572124240/
    GitHub          : https://github.com/Cefbic
    Date Created    : 2025-10-19
    Last Modified   : 2025-10-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000090

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  Run this script as Administrator to enforce STIG WN11-CC-000090.
Ensures Group Policy continues to process changes by setting:
HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\NoGPOListChanges = 0
No restart is required.
#>



# STIG Fix - WN11-CC-000090
# Ensure Group Policy refresh does not disable processing of GPO list changes (NoGPOListChanges = 0)

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
$name = "NoGPOListChanges"
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
