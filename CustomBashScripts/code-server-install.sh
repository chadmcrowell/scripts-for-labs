# Install code-server
wget https://github.com/cdr/code-server/releases/download/2.1688-vsc1.39.2/code-server2.1688-vsc1.39.2-linux-x86_64.tar.gz
tar -xvzf code-server2.1688-vsc1.39.2-linux-x86_64.tar.gz
cp code-server2.1688-vsc1.39.2-linux-x86_64/code-server /usr/local/bin/

# Install specific extensions
# su -c "/usr/local/bin/code-server --install-extension ms-python.python" cloud_user

# Start code-server systemd service
cat > /etc/systemd/system/code-server.service <<EOF
[Unit]
Description=VSCode on the Web
After=network.target
[Service]
User=azureuser
Group=azureuser
WorkingDirectory=/home/azureuser
ExecStart=/usr/local/bin/code-server -p 8080 --auth none
[Install]
WantedBy=multi-user.target
EOF

systemctl start code-server.service
systemctl enable code-server.service