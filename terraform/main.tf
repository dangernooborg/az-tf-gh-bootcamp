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

resource "azurerm_subnet" "bastionSubnet" {
  name                 = var.bootcamp_bastion_subnet_name
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.bootcampvNet.name
  address_prefixes     = [var.bootcamp_bastion_subnet_address_space]
}

resource "azurerm_public_ip" "bastionPIP" {
  name                = var.bootcamp_bastion_pip_name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  allocation_method   = "Static"
}

resource "azurerm_bastion_host" "bootcampBastion" {
  name                = var.bootcamp_bastion_name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastionSubnet.id
    public_ip_address_id = azurerm_public_ip.bastionPIP.id
  }
}
