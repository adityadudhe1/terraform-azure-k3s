resource "azurerm_virtual_network" "k3s" {
  name                = var.vnet_name
  address_space       = var.vnet_cidr
  location            = azurerm_resource_group.k3s.location
  resource_group_name = azurerm_resource_group.k3s.name
}

resource "azurerm_subnet" "k3s" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.k3s.name
  virtual_network_name = azurerm_virtual_network.k3s.name
  address_prefixes     = var.subnet_cidr
}
