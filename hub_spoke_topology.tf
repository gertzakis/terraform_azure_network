
# Deploy Hub Virtual Network and subnets
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

# Deploy ER Gateway ~30min
module "er_gateway" {
  source = "./modules/er_gateway"
  depends_on = [
    module.hub_network
  ]
  providers           = { azurerm = azurerm.connectivity }
  hub_location        = var.hub_location
  gateway_subnet_id   = module.hub_network.gateway_subnet_id
  hub_resource_group  = var.hub_resource_group
  er_gateway_pip_name = var.er_gateway_pip_name
  er_gateway_name     = var.er_gateway_name
  er_gateway_sku      = var.er_gateway_sku

}

# Deploy VPN Gateway ~30min
module "vpn_gateway" {
  source = "./modules/vpn_gateway"
  depends_on = [
    module.hub_network,
    module.er_gateway
  ]
  providers            = { azurerm = azurerm.connectivity }
  hub_location         = var.hub_location
  gateway_subnet_id    = module.hub_network.gateway_subnet_id
  hub_resource_group   = var.hub_resource_group
  vpn_gateway_pip_name = var.vpn_gateway_pip_name
  vpn_gateway_name     = var.vpn_gateway_name
  vpn_gateway_sku      = var.vpn_gateway_sku
}

# Deploy Azure Firewall ~30min
module "azure_firewall" {
  source = "./modules/azure_firewall"
  depends_on = [
    module.hub_network
  ]

  providers          = { azurerm = azurerm.connectivity }
  hub_location       = var.hub_location
  firewall_subnet_id = module.hub_network.firewall_subnet_id
  hub_resource_group = var.hub_resource_group
  firewall_pip_name  = var.firewall_pip_name
  firewall_name      = var.firewall_name
  firewall_sku_tier  = var.firewall_sku_tier
}

# Deploy a Spoke network - Identity
module "spoke_network" {
  source = "./modules/spoke_network"
  depends_on = [
    module.hub_network,
    # module.er_gateway,
    # module.vpn_gateway
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
  spoke_vnet_subnets   = var.identity_vnet_subnets
  spoke_udr_name       = var.identity_udr_name
  spoke_udr_routes     = var.identity_udr_routes
}

