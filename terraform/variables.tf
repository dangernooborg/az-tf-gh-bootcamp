variable "resource_group_name1" {
  type        = string
  description = "I am a resource group name"
}

variable "resource_group_location1" {
  type        = string
  description = "I am a resource group location"
}

variable "vnet_name" {
  type        = string
  description = "I am a vnet name for the bootcamp"
}

variable "vnet_address_space" {
  type        = string
  description = "I am a vnet address space"
}

variable "bastion_subnet_name" {
  type        = string
  description = "I am a bastion name"
}

variable "bastion_subnet_address_space" {
  type        = string
  description = "I am a bastion address space"
}

variable "bastion_pip_name" {
  type        = string
  description = "I am a bastion PIP name"
}

variable "bastion_name" {
  type        = string
  description = "I am a bastion host name"
}

variable "storage_account_name" {
  type        = string
  description = "I am a storage account name"
}

variable "private_endpoint_subnet_name" {
  type        = string
  description = "I am a private endpoint subnet name"
}

variable "private_endpoint_connection_name" {
  type        = string
  description = "I am private endpoint connection name"
}

variable "private_endpoint_subnet_address_prefixes" {
  type        = string
  description = "I am private endpoint subnet address prefixes"
}

variable "private_dns_zone_vnet_link_name" {
  type        = string
  description = "I am private endpoint subnet address prefixes"
}

variable "private_dns_zone_group_name" {
  type        = string
  description = "I am private DNS zone group name"
}
