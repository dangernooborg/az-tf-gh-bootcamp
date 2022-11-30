resource "azurerm_resource_group" "rg1" {
  name     = var.bootcamp_resource_group_name1
  location = var.bootcamp_resource_group_location1
}

resource "azurerm_virtual_network" "bootcampvNet" {
  name                = var.bootcamp_vnet_name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = [var.bootcamp_vnet_address_space]
}
