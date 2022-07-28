resource "azurerm_resource_group" "terraform_session_2" {
  name     = local.resource_group_name
  location = var.location
}