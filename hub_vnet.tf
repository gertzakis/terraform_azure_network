
module "hub_network" {
  source = "./modules/hub_network"

  providers          = { azurerm = azurerm.connectivity }
  hub_resource_group = var.hub_resource_group
  hub_location       = var.hub_location
  hub_vnet_name      = var.hub_vnet_name
  hub_vnet_cidr      = var.hub_vnet_cidr
  gateway_subnet     = var.gateway_subnet
  firewall_subnet    = var.firewall_subnet
}

module "net_resources" {
  source = "./modules/net_resources"
  depends_on = [
    module.hub_network
  ]

  providers               = { azurerm = azurerm.connectivity }
  hub_location            = var.hub_location
  gateways_resource_group = var.gateways_resource_group
  firewall_resource_group = var.firewall_resource_group
  gateway_subnet_id       = module.hub_network.gateway_subnet_id
  firewall_subnet_id      = module.hub_network.firewall_subnet_id
}


module "spoke_network" {
  source = "./modules/spoke_network"
  depends_on = [
    module.hub_network,
    module.net_resources
  ]

  providers = { azurerm.spoke = azurerm.identity
  azurerm.connectivity = azurerm.connectivity }
  spoke_location       = var.identity_vnet_location
  spoke_resource_group = var.identity_resource_group
  spoke_vnet_name      = var.identity_vnet_name
  spoke_vnet_cidr      = var.identity_vnet_cidr
  hub_vnet_id          = module.hub_network.hub_vnet_id
  hub_resource_group   = var.hub_resource_group
  hub_vnet_name        = var.hub_vnet_name
}
