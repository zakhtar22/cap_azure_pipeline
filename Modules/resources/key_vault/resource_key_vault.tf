/* provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
} 
*/

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example_key_vault" {
  name                        =  local.kvname
  location                    = var.location
  resource_group_name         = var.azure_resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","Create",
    ]

    secret_permissions = [
      "Get","Set","List","Delete","Purge","Restore",
    ]

    /* storage_permissions = [
      "Get",
    ] */
  }
}

resource "azurerm_key_vault_secret" "example" {
  count = var.resource_instance_count

  #name                    = "${var.azure_key_vault}-${var.unique_ID}"
  name                    = "${var.azure_key_vault}-kv"
  value                   = var.key_vault_password[count.index].result
  key_vault_id            = azurerm_key_vault.example_key_vault.id
}
