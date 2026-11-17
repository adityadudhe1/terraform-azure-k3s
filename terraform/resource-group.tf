resource "azurerm_resource_group" "k3s" {
  name     = var.resource_group_name
  location = var.location
}
