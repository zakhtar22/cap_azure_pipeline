# Outputs for use via the modules

output "subnet_id" {
  value = azurerm_subnet.example_subnet.id
}

output "network_id" {
  value = azurerm_virtual_network.example_vpc.id
}