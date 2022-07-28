##Create Network Dependencies

module "example_vpc" {
  source                     = "../../resources/network"
  network_name               = var.network_name
  azure_resource_group_name  = azurerm_resource_group.terraform_session_2.name
  location                   = azurerm_resource_group.terraform_session_2.location
  network_address            = var.network_address
  resource_instance_count    = var.resource_instance_count
  
  #platform_location_az_count = var.platform_location_az_count
}

