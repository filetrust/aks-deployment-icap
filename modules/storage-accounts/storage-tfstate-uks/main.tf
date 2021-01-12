resource "random_string" "name" {
  length  = 4
  special = false
  upper   = false
  lower   = false
}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region
}

# Create Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "gwstorageacc${random_string.name.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  access_tier              = var.access_tier
  account_replication_type = var.application_replication_type
  
  tags = {
    environment = "test"
    created_by  = "Mattp"
  }
}