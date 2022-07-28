resource "azurerm_windows_virtual_machine" "main" {
  count                 = var.resource_instance_count
  name                  = "${local.resource_name}${count.index + 1}"
  location              = azurerm_resource_group.terraform_session_2.location
  resource_group_name   = azurerm_resource_group.terraform_session_2.name
  network_interface_ids = [azurerm_network_interface.example_nic[count.index].id]
  admin_username        = var.admin_username
  admin_password        = random_password.vm_password[count.index].result
  size                  = var.azure_vm_size
  availability_set_id   = local.platform_location_az_count < 1 ? azurerm_availability_set.example_aset[0].id : null
  zone                  = local.platform_location_az_count > 1 ? (count.index % local.platform_location_az_count) + 1 : null

  source_image_reference {

    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.sku_vm
    version   = "latest"
  }
  os_disk {
    name                 = "MyOSDisk${count.index + 1}"
    storage_account_type = var.vm_disk_type
    disk_size_gb         = var.vm_disk_size
    caching              = "ReadOnly"
  }
}

resource "azurerm_availability_set" "example_aset" {
  count                        = local.platform_location_az_count < 1 ? 1 : 0
  name                         = local.resource_name
  location                     = azurerm_resource_group.terraform_session_2.location
  resource_group_name          = azurerm_resource_group.terraform_session_2.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}

resource "azurerm_network_interface" "example_nic" {
  depends_on = [
    module.example_vpc
  ]
  count               = var.resource_instance_count
  name                = "${local.resource_name}${count.index + 1}"
  location            = azurerm_resource_group.terraform_session_2.location
  resource_group_name = azurerm_resource_group.terraform_session_2.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.example_vpc.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example_public_ip[count.index].id
  }
}

resource "azurerm_public_ip" "example_public_ip" {
  count               = var.resource_instance_count
  name                = "acceptanceTestPublicIp-${count.index + 1}"
  resource_group_name = azurerm_resource_group.terraform_session_2.name
  location            = azurerm_resource_group.terraform_session_2.location
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = local.platform_location_az_count > 1 ? [(count.index % local.platform_location_az_count) + 1] : null
}
