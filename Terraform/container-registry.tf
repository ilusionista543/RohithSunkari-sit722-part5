#
# Creates a container registry on Azure so that you can publish your Docker images.
#
resource "azurerm_container_registry" "registry101" {
  name                = "registry101"
  resource_group_name = azurerm_resource_group.sit722project.name
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"
}

output "acr_login_server" {
  value = azurerm_container_registry.registry101.login_server
}

output "registry_name" {
  value = azurerm_container_registry.registry101.name
}

output "registry_admin_username" {
  value = azurerm_container_registry.registry101.admin_username
}
output "registry_admin_password" {
  value = azurerm_container_registry.registry101.admin_password
  sensitive = true 
}