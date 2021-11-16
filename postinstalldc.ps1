if ((Test-Path -path "C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.10.12\Downloads\7\postinstalldc.ps1") -eq "$true") {
    remove-item -path "C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.10.12\Downloads\7\postinstalldc.ps1" -force
}
if ((Test-Path -path "c:\labscripts\vulnad.ps1") -eq "$true") {
    remove-item -path "c:\labscripts\vulnad.ps1" -force
}
if ((Test-Path -path "c:\labscripts") -eq "$false") {
    new-item -path "c:\" -ItemType "directory" -Name "labscripts" -force
}
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/thegoatreich/vulnerable-AD/master/vulnad.ps1" -outfile "c:\labscripts\vulnad.ps1"
Import-Module "c:\labscripts\vulnad.ps1"
Invoke-VulnAD -UsersLimit 666 -DomainName "lab.local"
