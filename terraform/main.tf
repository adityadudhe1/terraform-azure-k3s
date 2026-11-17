resource "azurerm_resource_group" "k3s" {
  name     = "rg-k3s-demo"
  location = var.location
}
