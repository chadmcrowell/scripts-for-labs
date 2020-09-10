#!/bin/bash

rm -rf /var/lib/apt/lists/*

apt-get update

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
