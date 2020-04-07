Invoke-WebRequest -Uri https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe -OutFile C:\Users\Public\Downloads\DockerDesktopInstaller.exe

Start-Sleep -s 30

Start-Process -FilePath "C:\Users\Public\Downloads\DockerDesktopInstaller.exe"

