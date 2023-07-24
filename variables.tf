
variable "subscription_id" {
  description = "This subscription_id is part of Azure"
  default = "36e59b87-569e-4a61-bae8-4e2f60f8ced7"
}
variable "tenant_id" {
  description = "This tenant id is part of Azure"
  default = "6c1408d5-cd77-4fe3-b27f-27308a9f311c"
}
variable "client_id" {
  description = "This client id is part of Azure"
  default = ""
}
variable "client_secret" {
  description = "This secret id is part of Azure"
  default = ""
}

variable "prefix" {
  description = "This prefix will be included in the name of most resources."
  default = "az-tf"
}
variable "resource_group_name" {
  description = "The resource group name resources would be grouped under."
  default     = "az-tf-grp"
}

variable "location" {
  description = "The region where the virtual network is created."
  default     = "East US"
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.10.0/24"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_F2"
}

variable "image_publisher" {
  description = "Name of the publisher of the image (az vm image list)"
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "Name of the offer (az vm image list)"
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "Image SKU to apply (az vm image list)"
  default     = "2016-Datacenter"
}

variable "image_version" {
  description = "Version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "admin_username" {
  description = "Administrator user name for windows"
  default     = "adminuser"
}

variable "admin_password" {
  description = "Administrator password for windows"
  default     = "P@$$w0rd1234!"
}

variable "account_replication_type" {
  description = "The storage account replication type."
  default     = "LRS"
}
variable "account_tire" {
  description = "The storage account tire."
  default     = "Standard"
}
