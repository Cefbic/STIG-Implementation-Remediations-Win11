<#
.SYNOPSIS
    This PowerShell script Ensure Windows Hello for Business requires a security device

.NOTES
    Author          : Monsif Bichara
    LinkedIn        : https://www.linkedin.com/in/monsif-bichara-572124240/
    GitHub          : https://github.com/Cefbic
    Date Created    : 2025-10-20
    Last Modified   : 2025-10-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000255

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  Run this script as Administrator to enforce STIG WN11-CC-000255.
Requires Windows Hello for Business to use a security device (e.g., TPM) by setting:
HKLM\SOFTWARE\Policies\Microsoft\PassportForWork\RequireSecurityDevice = 1

Note: Not applicable (NA) for virtual desktop environments that reset on logoff.
#>



# STIG Fix - WN11-CC-000255
# Ensure Windows Hello for Business requires a security device (RequireSecurityDevice = 1)

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork"
$name = "RequireSecurityDevice"
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
