Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

Start-Sleep -s 15

Start-Service sshd

Set-Service -Name sshd -StartupType 'Automatic'

$config=@'
PasswordAuthentication yes
PubkeyAuthentication yes
Subsystem	sftp	sftp-server.exe
Subsystem powershell c:/progra~1/powershell/6/pwsh.exe -sshs -NoLogo -NoProfile
Match Group administrators
       AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys
'@

Out-File -FilePath C:\ProgramData\ssh\sshd_config -InputObject $config

Set-ExecutionPolicy AllSigned -Force

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Start-Sleep -s 20

Restart-Service sshd
