new-item -path "c:\" -ItemType "directory" -Name "labscripts"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/wazehell/vulnerable-AD/master/vulnad.ps1" -outfile "c:\labscripts\vulnad.ps1"
Import-Module "c:\labscripts\vulnad.ps1"
Invoke-VulnAD -UsersLimit 666 -DomainName "lab.local"