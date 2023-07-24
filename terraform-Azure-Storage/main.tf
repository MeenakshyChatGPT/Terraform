terraform {
  required_providers {
    azurerm={
        source="hashicorp/azurerm"
        version="3.65.0"
    }
  }
}

provider "azurerm" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features{
  }
}

resource "azurerm_storage_account" "main" {
  name                     = "storage66656account"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tire
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_share" "main" {
  name                 = "${var.prefix}-filestorage"
  storage_account_name = azurerm_storage_account.main.name
  quota                = 1
}

