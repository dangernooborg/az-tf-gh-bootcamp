resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name1
  location = var.resource_group_location1
}

resource "azurerm_storage_account" "bootcampSA" {
  name                     = var.storage_account_name
  location                 = azurerm_resource_group.rg1.location
  resource_group_name      = azurerm_resource_group.rg1.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
