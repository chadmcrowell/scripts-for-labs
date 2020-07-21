#!/bin/bash

# install powershell 
sudo snap install powershell --classic

sleep 30

pwsh

New-AzSubscriptionDeployment `
  -Name demoDeployment `
  -Location westus `
  -TemplateUri https://raw.githubusercontent.com/Azure/azure-docs-json-samples/master/azure-resource-manager/emptyRG.json `
  -rgName nodeGroup `
  -rgLocation westus