#create virtual network
resource "azurerm_virtual_network" "example_vpc" {
  name                = var.network_name
  resource_group_name = var.azure_resource_group_name
  location            = var.location
  address_space       = [var.network_address]
}

#create network subnet
resource "azurerm_subnet" "example_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.azure_resource_group_name
  virtual_network_name = azurerm_virtual_network.example_vpc.name
  address_prefixes     = cidrsubnets(var.network_address, 1)
}

#add route table
resource "azurerm_route_table" "route_table" {
  name                          = var.subnet_name
  location                      = var.location
  resource_group_name           = var.azure_resource_group_name
  disable_bgp_route_propagation = false

}

#create internet route
resource "azurerm_route" "UDR_internet" {
  name                = "UDR_internet"
  route_table_name    = azurerm_route_table.route_table.name
  resource_group_name = var.azure_resource_group_name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

#create route table association
resource "azurerm_subnet_route_table_association" "subnet_association" {
  subnet_id      = azurerm_subnet.example_subnet.id
  route_table_id = azurerm_route_table.route_table.id
}

#add network security group
resource "azurerm_network_security_group" "network_security_group" {
  name                = var.subnet_name
  location            = var.location
  resource_group_name = var.azure_resource_group_name
}

#create a network security group association (bind it to the subnet)
resource "azurerm_subnet_network_security_group_association" "network_security_group_assocation" {
  subnet_id                 = azurerm_subnet.example_subnet.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}
