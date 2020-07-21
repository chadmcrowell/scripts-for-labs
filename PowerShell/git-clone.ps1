git clone https://github.com/chadmcrowell/fileshare.git c:\FileShare1

New-SmbShare -Name "Code" -Path "C:\code"

New-PSDrive -Name "S" -Root "\\lab-VM\code" -Persist -PSProvider "FileSystem"
