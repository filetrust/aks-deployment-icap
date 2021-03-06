#!/bin/bash

# Script adapted from https://docs.microsoft.com/en-us/azure/terraform/terraform-backend.
# We cannot create this storage account and blob container using Terraform itself since
# we are creating the remote state storage for Terraform and Terraform needs this storage in terraform init phase.

LOCATION=UKSOUTH
RESOURCE_GROUP_NAME=gw-icap-tfstate-qa-uks
STORAGE_ACCOUNT_NAME=ukstfstate$RANDOM
CONTAINER_NAME=gw-icap-tfstate-qa-uks
SHARE_NAME01=transactions
SHARE_NAME02=policies
VAULT_NAME=gw-icap-qa-vault
TAGS='createdby=mattp'

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION --tags $TAGS

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob --tags $TAGS

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query "[0].value" | tr -d '"')

# Create blob  
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

# Create file share
az storage share create --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY --name $SHARE_NAME01  --quota 100 --output none

# Create file share
az storage share create --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY --name $SHARE_NAME02  --quota 100 --output none

# Create Key Vault
az keyvault create --name $VAULT_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"