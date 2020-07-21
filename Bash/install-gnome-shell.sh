#!/bin/bash

# update 
sudo apt-get update

# install gnome desktop
sudo apt-get install -y ubuntu-gnome-desktop

# sleep
sleep 14m

# install xrdp 
sudo apt-get install -y xrdp

# change console access from root only to all users 
sudo sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config

# bypass the authentication screen
cat > /etc/polkit-1/localauthority.conf.d/02-allow-colord.conf << EOF
polkit.addRule(function(action, subject) {
if ((action.id == "org.freedesktop.color-manager.create-device" ||
action.id == "org.freedesktop.color-manager.create-profile" ||
action.id == "org.freedesktop.color-manager.delete-device" ||
action.id == "org.freedesktop.color-manager.delete-profile" ||
action.id == "org.freedesktop.color-manager.modify-device" ||
action.id == "org.freedesktop.color-manager.modify-profile") &&
subject.isInGroup("{group}")) {
return polkit.Result.YES;
}
}); 
EOF

# install the gnome tweak tool to display the desktop dock
sudo apt-get install -y gnome-tweak-tool
