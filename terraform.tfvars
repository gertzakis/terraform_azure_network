# Hub resources
hub_resource_group   = "ebci-rg-network-prod-01"
hub_location         = "westeurope"
er_gateway_name      = "ebpi-we-vgw-01"
er_gateway_pip_name  = "ebpi-we-vgw-01-pip-01"
er_gateway_sku       = "ErGw1AZ" # ErGw1Az / ErGw2Az / ErGw3Az
vpn_gateway_pip_name = "ebpi-we-vgw-01-pip-02"
vpn_gateway_name     = "ebpi-we-vgw-02"
vpn_gateway_sku      = "VpnGw1"
firewall_name        = "ebpi-we-fw-01"
firewall_pip_name    = "ebpi-we-fw-01-pip-01"
firewall_sku_tier    = "Standard" # Standard / Premium
hub_vnet_name        = "ebpi-we-vnet-hub"
hub_vnet_cidr        = "10.0.0.0/16"
gateway_subnet       = "10.0.0.0/24"
firewall_subnet      = "10.0.1.0/24"
# Identity resources
identity_resource_group = "ebci-rg-network-prod-02"
identity_vnet_name      = "ebpi-we-vnet-prod"
identity_vnet_location  = "westeurope"
identity_vnet_cidr      = "10.10.0.0/20"
identity_udr_name       = "ebpi-we-udr-forced-tunneling-to-nva"
identity_vnet_subnets = {
  subnet_1 = {
    name             = "ebpi-we-vnet-hub-sub-term-10.10.0.0_24"
    address_prefixes = "10.10.0.0/24"
    nsg_name         = "ebpi-we-nsg-subnet-10.10.0.0_24"
  }
  subnet_2 = {
    name             = "ebpi-we-vnet-hub-sub-term-10.10.1.0_24"
    address_prefixes = "10.10.1.0/24"
    nsg_name         = "ebpi-we-nsg-subnet-10.10.1.0_24"
  }
}
