locals {
  #location_prefix            = replace(var.location, "/[a-z[:space:]]/", "")
  kvname = substr("${var.azure_key_vault}-${random_id.id.hex}",0,20)
}