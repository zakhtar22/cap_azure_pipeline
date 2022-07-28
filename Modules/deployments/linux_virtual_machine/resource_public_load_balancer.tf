## Create network dependencies

module "public_load_balancer" {
  source                    = "../../resources/public_load_balancer"
  location                  = azurerm_resource_group.terraform_session_2.location
  azure_resource_group_name = azurerm_resource_group.terraform_session_2.name
  vm_environment            = var.vm_environment
  resource_name             = local.resource_name
  resource_instance_count   = var.resource_instance_count
  vm_network_id             = module.example_vpc.network_id
  network_address           = var.network_address
}
