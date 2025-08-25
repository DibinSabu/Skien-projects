Add-WindowsFeature -Name Web-Server

New-NetFirewallRule -DisplayName "Allow HTTP Port 80" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow

Start-Service W3SVC
Set-Service W3SVC -StartupType Automatic

New-Item -ItemType Directory -Path "C:\WebContent" -Force
"Hello from PowerShell!" | Out-File -FilePath "C:\WebContent\index.html" -Encoding utf8

Import-Module WebAdministration
Set-ItemProperty "IIS:\Sites\Default Web Site" -Name physicalPath -Value "C:\WebContent"