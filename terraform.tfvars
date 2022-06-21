# Hub resources
hub_resource_group   = "hub-resource-group"
hub_location         = "westeurope"
er_gateway_name      = "er-gateway"
er_gateway_pip_name  = "er-gateway-pip"
er_gateway_sku       = "ErGw1AZ"
vpn_gateway_pip_name = "vpn-gateway-pip"
vpn_gateway_name     = "vpn-gatewayn-name"
vpn_gateway_sku      = "VpnGw1"
firewall_name        = "azure-firewall"
firewall_pip_name    = "azure-firewall-public-ip"
firewall_sku_tier    = "Standard"
hub_vnet_name        = "makis-hub-vnet"
hub_vnet_cidr        = "10.0.0.0/16"
gateway_subnet       = "10.0.0.0/24"
firewall_subnet      = "10.0.1.0/24"
# Identity resources
identity_resource_group = "identity-resource-group"
identity_vnet_name      = "identity-vnet-name"
identity_vnet_location  = "westeurope"
identity_vnet_cidr      = "10.10.0.0/20"
identity_vnet_subnets = {
  subnet_1 = {
    name             = "subnet_1"
    address_prefixes = "10.10.0.0/24"
    nsg_name         = "subnet_1-nsg"
  }
  subnet_2 = {
    name             = "subnet_2"
    address_prefixes = "10.10.1.0/24"
    nsg_name         = "subnet_2-nsg"
  }
}

