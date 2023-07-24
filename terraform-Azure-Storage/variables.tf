
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
  default =  ""
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

variable "account_replication_type" {
  description = "The storage account replication type."
  default     = "LRS"
}
variable "account_tire" {
  description = "The storage account tire."
  default     = "Standard"
}
