module "data_disks" {
  count                     = var.resource_instance_count
  source                    = "../../resources/disks/"
  location                  = azurerm_resource_group.terraform_session_2.location
  azure_resource_group_name = azurerm_resource_group.terraform_session_2.name
  resource_environment      = var.vm_environment
  resource_name             = "${local.resource_name}${count.index + 1}"
  resource_zone             = local.platform_location_az_count > 1 ? (count.index % local.platform_location_az_count) + 1 : null
  vm_data_disk_count        = var.vm_data_disk_count
  vm_data_disk_size         = var.vm_data_disk_size
  resource_vm_id            = azurerm_windows_virtual_machine.main[count.index].id
}

