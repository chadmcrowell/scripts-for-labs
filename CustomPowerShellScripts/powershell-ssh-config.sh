#!/bin/bash

# install powershell 
sudo snap install powershell --classic

sleep 30

# replace sshd_config
cat << EOF | sudo tee /etc/ssh/sshd_config
PasswordAuthentication yes
PubKeyAuthentication yes
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem       sftp    /usr/lib/openssh/sftp-server
Subsystem       powershell /snap/powershell/current/opt/powershell/pwsh -sshs -NoLogo -NoProfile
ClientAliveInterval 120
EOF
