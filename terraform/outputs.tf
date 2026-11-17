output "resource_group_name" {
  value = azurerm_resource_group.k3s.name
}

output "vnet_name" {
  value = azurerm_virtual_network.k3s.name
}

output "subnet_name" {
  value = azurerm_subnet.k3s.name
}
