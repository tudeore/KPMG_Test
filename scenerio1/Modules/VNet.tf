resource "azurerm_virtual_network" "VNet" {
  name = var.vnet_name
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space = var.address_space
}