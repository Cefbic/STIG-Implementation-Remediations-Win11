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
    STIG-ID         : WN11-CC-000360

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
   Run this script as Administrator to enforce STIG WN11-CC-000360.
It disables Digest authentication for the WinRM client by setting:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\AllowDigest to 0.
A system restart is not required. 
#>


# STIG Fix - WN11-CC-000360
# Ensure WinRM client does not use Digest authentication

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
$valueName = "AllowDigest"
$desiredValue = 0

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    Write-Output "Creating registry path: $regPath"
    New-Item -Path $regPath -Force | Out-Null
}

# Get current value (if exists)
$currentValue = Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $valueName -ErrorAction SilentlyContinue

# Set the value if needed
if ($currentValue -ne $desiredValue) {
    Write-Output "Setting '$valueName' to '$desiredValue' in '$regPath'"
    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
    Write-Output "Digest authentication has been disabled for WinRM client."
} else {
    Write-Output "Digest authentication is already disabled (value = $desiredValue). No changes made."
}
