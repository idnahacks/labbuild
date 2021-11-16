new-item -path "c:\" -ItemType "directory" -Name "labscripts" -force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/thegoatreich/vulnerable-AD/master/vulnad.ps1" -outfile "c:\labscripts\vulnad.ps1" -force
Import-Module "c:\labscripts\vulnad.ps1"
Invoke-VulnAD -UsersLimit 666 -DomainName "lab.local"
