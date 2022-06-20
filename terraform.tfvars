hub_resource_group = "hub-resource-group"
hub_location = "westeurope"
hub_vnet_name  = "makis-hub-vnet"
hub_vnet_cidr  = "10.0.0.0/16"
gateway_subnet  = "10.0.0.0/24"
firewall_subnet = "10.0.1.0/24"
gateways_resource_group = "gateway-resource-group"
firewall_resource_group = "firewall-resource-group"
identity_resource_group = "identity-resource-group"
identity_vnet_name = "identity-vnet-name"
identity_vnet_location = "westeurope"
identity_vnet_cidr = "10.10.0.0/20"
identity_vnet_subnets = {
    subnet_1 = {
        name = "subnet_1"
        address_prefixes = "10.10.0.0/24"
    }
    subnet_2 = {
        name = "subnet_2"
        address_prefixes = "10.10.1.0/24"
    }
}
