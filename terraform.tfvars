# Hub resources
hub_resource_group   = "rg-network-prod-01"
hub_location         = "westeurope"
er_gateway_name      = "we-vgw-01"
er_gateway_pip_name  = "we-vgw-01-pip-01"
er_gateway_sku       = "ErGw1AZ" # ErGw1Az / ErGw2Az / ErGw3Az
vpn_gateway_pip_name = "we-vgw-02-pip-01"
vpn_gateway_name     = "we-vgw-02"
vpn_gateway_sku      = "VpnGw2AZ"
firewall_name        = "we-fw-01"
firewall_pip_name    = "we-fw-01-pip-01"
firewall_sku_tier    = "Standard" # Standard / Premium
hub_vnet_name        = "we-vnet-hub"
hub_vnet_cidr        = "10.12.16.0/20"
gateway_subnet       = "10.12.16.64/26"
firewall_subnet      = "10.12.16.0/26"
bastion_subnet       = "10.12.16.128/26"
# Identity resources
identity_resource_group = "rg-network-ident-01"
identity_vnet_name      = "we-vnet-ident"
identity_vnet_location  = "westeurope"
identity_vnet_cidr      = "10.12.112.0/20"
identity_udr_name       = "we-udr-forced-tunneling-to-nva"
identity_vnet_subnets = {
  subnet_1 = {
    name             = "we-vnet-ident-sub-term-10.12.112.0_27"
    address_prefixes = "10.12.112.0/27"
    nsg_name         = "we-nsg-subnet-10.10.0.0_24-001"
  }
}
# identity_udr_routes = {
#   route_01 = {
#     name                   = "10.20.0.0_20"
#     address_prefix         = "10.20.0.0/20"
#     next_hop_type          = "VirtualAppliance"
#     next_hop_in_ip_address = "10.0.0.4"
#   }
# route_02 = {
#   name                   = "10.10.0.0_20"
#   address_prefix         = "10.30.0.0/20"
#   next_hop_type          = "VirtualAppliance"
#   next_hop_in_ip_address = "10.0.0.4"
# }
# }
