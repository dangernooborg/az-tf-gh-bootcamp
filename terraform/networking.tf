resource "azurerm_virtual_network" "bootcampvNet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = [var.vnet_address_space]
}

resource "azurerm_subnet" "bastionSubnet" {
  name                 = var.bastion_subnet_name
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.bootcampvNet.name
  address_prefixes     = [var.bastion_subnet_address_space]
}

resource "azurerm_subnet" "privendpoint" {
  name                 = var.private_endpoint_subnet_name
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.bootcampvNet.name
  address_prefixes     = [var.private_endpoint_subnet_address_prefixes]

  private_endpoint_network_policies_enabled = true
}

resource "azurerm_private_dns_zone" "pe" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = var.private_dns_zone_vnet_link_name
  resource_group_name   = azurerm_resource_group.rg1.name
  private_dns_zone_name = azurerm_private_dns_zone.pe.name
  virtual_network_id    = azurerm_virtual_network.bootcampvNet.id
}

resource "azurerm_private_endpoint" "sa" {
  name                = "${azurerm_storage_account.bootcampSA.name}-pe"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  subnet_id           = azurerm_subnet.privendpoint.id

  private_service_connection {
    name                           = var.private_endpoint_connection_name
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.bootcampSA.id
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = [azurerm_private_dns_zone.pe.id]
  }
}
resource "azurerm_public_ip" "bastionPIP" {
  name                = var.bastion_pip_name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bootcampBastion" {
  name                = var.bastion_name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  sku                 = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastionSubnet.id
    public_ip_address_id = azurerm_public_ip.bastionPIP.id
  }
}
