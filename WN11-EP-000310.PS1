<#
.SYNOPSIS
    Ensure Kernel DMA Protection policy DeviceEnumerationPolicy is set to 0

.NOTES
    Author          : Monsif Bichara
    LinkedIn        : https://www.linkedin.com/in/monsif-bichara-572124240/
    GitHub          : https://github.com/Cefbic
    Date Created    : 2025-10-19
    Last Modified   : 2025-10-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-EP-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  Run this script as Administrator to enforce STIG WN11-EP-000310.
Sets the following registry value to enhance Kernel DMA Protection:
HKLM\Software\Policies\Microsoft\Windows\Kernel DMA Protection\DeviceEnumerationPolicy = 0
No restart required.
#>



# STIG Fix - WN11-EP-000310
# Ensure Kernel DMA Protection policy DeviceEnumerationPolicy is set to 0

$regPath = "HKLM:\Software\Policies\Microsoft\Windows\Kernel DMA Protection"
$name = "DeviceEnumerationPolicy"
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
