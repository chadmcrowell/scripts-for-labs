#!/bin/bash

sudo snap install microk8s --classic

sudo usermod -a -G microk8s azureuser
sudo chown -f -R azureuser ~/.kube
