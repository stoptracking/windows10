#Requires -RunAsAdministrator
#Requires -Version 5

#
# https://github.com/stoptracking/windows10
#

Write-Host "Disable NetBios for all interfaces"
$regkey = "HKLM:SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces"
Get-ChildItem $regkey | ForEach-Object { Set-ItemProperty -Path "$regkey\$($_.pschildname)" -Name NetbiosOptions -Value 2 -Verbose}

Write-Host "Disable LLDP for all interfaces"
Disable-NetAdapterBinding -Name "*" -ComponentID ms_lldp

Write-Host "Disable LLTD for all interfaces"
Disable-NetAdapterBinding -Name "*" -ComponentID ms_lltdio
Disable-NetAdapterBinding -Name "*" -ComponentID ms_rspndr

Write-Host "Disable 'Client for MS Networks'"
Disable-NetAdapterBinding -Name "*" -ComponentID "ms_msclient"

Write-Host "Reset proxy settings (needed to stop WPAD correctly)"
netsh winhttp reset proxy



Write-Host "All done!"
