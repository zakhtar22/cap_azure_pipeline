resource "azurerm_traffic_manager_profile" "example_traffic_manager" {
  name                   = var.azure_tmp
  resource_group_name    = var.azure_resource_group_name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = random_id.server.hex
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }
}

resource "random_id" "server" {
  keepers     = { azi_id = 1 }
  byte_length = 8
}

resource "azurerm_traffic_manager_azure_endpoint" "example_tm_endpoint" {
  name               = var.azure_tm_endpoints
  profile_id         = azurerm_traffic_manager_profile.example_traffic_manager.id
  weight             = 100
  target_resource_id = azurerm_public_ip.public_ip.id
}
