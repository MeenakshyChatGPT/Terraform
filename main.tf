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

resource "azurerm_resource_group" "main" {
  name     = "az-tf-grp"
  location = "East US"
}

resource "azurerm_virtual_network" "main" {
  name                = "az-tf-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "az-tf-nic"
  location            = "East US"
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "main" {
  name                = "az-tf-vm"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_storage_account" "main" {
  name                     = "azstorageaccount666"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "main" {
  name                 = "az-tf-filestorage"
  storage_account_name = azurerm_storage_account.main.name
  quota                = 1
}
