terraform {
  required_providers {
    azurerm={
        source="hashicorp/azurerm"
        version="3.65.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "36e59b87-569e-4a61-bae8-4e2f60f8ced7"
    tenant_id  ="6c1408d5-cd77-4fe3-b27f-27308a9f311c"
    client_id = "165c7743-4543-48b0-a480-fa84c25fe8af"
    client_secret = "BOW8Q~gHfUvp4NPsDqKRBgt2fceZKj_vHo-F9bv1"
    features {      
    }
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_prefix]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "main" {
  name                = "${var.prefix}-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
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
