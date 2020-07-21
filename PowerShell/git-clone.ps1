git clone https://github.com/chadmcrowell/fileshare.git c:\FileShare1

New-SmbShare -Name "FileShare1" -Path "C:\FileShare1" -FullAccess "Administrators"

New-PSDrive -Name "S" -Root "\\vm1\FileShare1" -Persist -PSProvider "FileSystem"
