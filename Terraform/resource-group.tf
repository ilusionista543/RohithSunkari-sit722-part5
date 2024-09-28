#
# Creates a resource group for FlixTube in your Azure account.
#
resource "azurerm_resource_group" "sit722project" {
  name     = "sit722project"
  location = var.location
}
