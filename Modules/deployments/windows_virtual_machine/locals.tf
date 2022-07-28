locals {
  location_prefix            = replace(var.location, "/[a-z[:space:]]/", "")
  resource_group_name        = "${var.azure_resource_group_name}-${local.location_prefix}"
  resource_name              = "${var.resource_name}-${local.location_prefix}"
  platform_location_az_count = lookup(var.platform_location_az_count, var.location, null)
}
