# Before install
1. Pray your gods
2. Un-plug ethernet if present, disable WiFi
3. Enable UEFI-native boot, "Secure boot", DEP, VTx/VT-d, 

# After
1. If necessary, install GPU drivers using offline installer
2. Turn on "controlled folder access" and "core isolation". Either manually or via GPo.
3. Enable "Windows Sandbox" and "Windows Defender App Guard" in "Windows features"
4. Download [DG readiness tool](https://www.microsoft.com/en-us/download/details.aspx?id=53337)  
  * Temporarily change execution policy for PowerShell scripts: `Set-ExecutionPolicy -ExecutionPolicy AllSigned`  
  * Check current status: `.\DG_Readiness_tool_v3.4.ps1 -Ready`  
  * Enable: `.\DG_Readiness_tool_v3.4.ps1 -Enable`  
  * Reboot, check again. Happy with the result? Don't forget to switch exec.policy back: `Set-ExecutionPolicy -ExecutionPolicy Restricted`  
5. Download O&O AppBuster and ShutUP. Adjust per taste, apply.
6. Run these from `cmd`:
  * Cortana:
```
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules"  /v "{2765E0F4-2918-4A46-B9C9-43CDD8FCBA2B}" /t REG_SZ /d  "BlockCortana|Action=Block|Active=TRUE|Dir=Out|App=C:\windows\systemapps\microsoft.windows.cortana_cw5n1h2txyewy\searchui.exe|Name=Search  and Cortana  application|AppPkgId=S-1-15-2-1861897761-1695161497-2927542615-642690995-327840285-2659745135-2630312742|" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
```
 * Disable 3D paint:
```
for /f "tokens=1* delims=" %I in (' reg query "HKEY_CLASSES_ROOT\SystemFileAssociations" /s /k /f "3D Edit" ^| find /i "3D Edit" ') do (reg delete "%I" /f )
for /f "tokens=1* delims=" %I in (' reg query "HKEY_CLASSES_ROOT\SystemFileAssociations" /s /k /f "3D Print" ^| find /i "3D Print" ') do (reg delete "%I" /f )
```
