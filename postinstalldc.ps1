###Setup landing area###

if ((Test-Path -path "c:\labscripts\vulnad.ps1") -eq $true) {
    remove-item -path "c:\labscripts\vulnad.ps1" -force
}
if ((Test-Path -path "c:\labscripts") -eq $false) {
    new-item -path "c:\" -ItemType "directory" -Name "labscripts" -force
}

###AD Tools
add-windowsfeature -name RSAT-ADDS-Tools
Set-Service -name ADWS -StartupType Automatic -Status Running

start-sleep -seconds 200

###Vuln-AD
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/idnahacks/vulnerable-AD/master/vulnad.ps1" -outfile "c:\labscripts\vulnad.ps1"
Import-Module "c:\labscripts\vulnad.ps1"
Invoke-VulnAD -UsersLimit 666 -DomainName "lab.local"

New-ADOrganizationalUnit -Name "Workstations" -Path "DC=lab,DC=local"
