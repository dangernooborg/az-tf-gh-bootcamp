variable "bootcamp_resource_group_name1" {
  type        = string
  description = "I am a resource group name"
}

variable "bootcamp_resource_group_location1" {
  type        = string
  description = "I am a resource group location"
}

variable "bootcamp_vnet_name" {
  type        = string
  description = "I am a vnet name for the bootcamp"
}

variable "bootcamp_vnet_address_space" {
  type        = string
  description = "I am a vnet address space"
}

variable "bootcamp_bastion_subnet_name" {
  type        = string
  description = "I am a bastion name"
}

variable "bootcamp_bastion_subnet_address_space" {
  type = string
  description = "I am a bastion address space"
}

variable "bootcamp_bastion_pip_name" {
  type = string
  description = "I am a bastion PIP name"
}

variable "bootcamp_bastion_name" {
  type = string
  description = "I am a bastion host name"
}
