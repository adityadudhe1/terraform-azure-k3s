resource "azurerm_virtual_network" "k3s" {
  name                = "vnet-k3s"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.k3s.location
  resource_group_name = azurerm_resource_group.k3s.name
}

resource "azurerm_subnet" "k3s" {
  name                 = "subnet-k3s"
  resource_group_name  = azurerm_resource_group.k3s.name
  virtual_network_name = azurerm_virtual_network.k3s.name
  address_prefixes     = ["10.0.1.0/24"]
}
