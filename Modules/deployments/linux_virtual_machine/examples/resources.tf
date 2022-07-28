module "server" {
  for_each                  = toset(var.location)
  source                    = "../"
  resource_name             = var.resource_name
  azure_resource_group_name = var.azure_resource_group_name
  location                  = each.value
  resource_instance_count   = var.resource_instance_count
  network_address           = lookup(var.network_address, each.value, null)
  azure_vm_size             = var.azure_vm_size
  vm_data_disk_count        = var.data_disk_count
  vm_data_disk_size         = var.vm_data_disk_size
  unique_ID                 = var.unique_ID
}
