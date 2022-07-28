module "key_vault" {
  source                    = "../../resources/key_vault"
  azure_resource_group_name = azurerm_resource_group.terraform_session_2.name
  location                  = azurerm_resource_group.terraform_session_2.location
  resource_instance_count   = var.resource_instance_count
  #key_vault_password        = random_password.vm_password[count.index].result
  azure_key_vault = local.resource_name
  key_vault_password        = random_password.vm_password
}