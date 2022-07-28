## Provision public IP for load balancer  

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.resource_name}-ip"
  location            = var.location
  resource_group_name = var.azure_resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = var.platform_location_az_count[var.location]
  domain_name_label   = "my-public-ip1-aygeqdy-${var.unique_ID}"
  #  zones   = var.platform_location_az_count > 1 ? var.platform_location_az_count + 1 : null
}


## Create load balancer

resource "azurerm_lb" "load_balancer" {
  name                = "${var.resource_name}-lb"
  location            = var.location
  resource_group_name = var.azure_resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = azurerm_public_ip.public_ip.name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

## Provision backend for load balancer 

resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = var.resource_name
}

## Provision addresses for backend pool

resource "azurerm_lb_backend_address_pool_address" "backend_address_pool_address" {
  count                   = var.resource_instance_count
  name                    = "${var.resource_name}${count.index + 1}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_address_pool.id
  virtual_network_id      = var.vm_network_id
  ip_address              = cidrhost(var.network_address, 4 + count.index)
}

## Create Healthcheck Availability Probe

resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = "HTTPS"
  port            = 443
}

## Create Load Balancer Rule For Probe

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = azurerm_lb_probe.probe.name
  protocol                       = "Tcp"
  frontend_port                  = azurerm_lb_probe.probe.port
  backend_port                   = azurerm_lb_probe.probe.port
  frontend_ip_configuration_name = azurerm_public_ip.public_ip.name
  probe_id                       = azurerm_lb_probe.probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_address_pool.id]
}
