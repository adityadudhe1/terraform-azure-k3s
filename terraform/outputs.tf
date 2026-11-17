output "resource_group_name" {
  value = azurerm_resource_group.k3s.name
}

output "vnet_name" {
  value = azurerm_virtual_network.k3s.name
}

output "subnet_name" {
  value = azurerm_subnet.k3s.name
}

output "master_public_ip" {
  value = azurerm_public_ip.master.ip_address
}

output "master_private_ip" {
  value = azurerm_network_interface.master.private_ip_address
}

output "worker_private_ip" {
  value = azurerm_network_interface.worker.private_ip_address
}
