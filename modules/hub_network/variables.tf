variable "hub_resource_group"{
    description = "Hub resource group"
    type = string
}
variable "hub_location"{
    description = "Location for hub resources"
    type = string
}

variable "hub_vnet_name"  {
    description = "Hub Virtual Network name"
    type = string
}

variable "hub_vnet_cidr"  {
    description = "Hub Virtual Network CIDR"
    type = string
}    

variable "gateway_subnet"  {
    description = "Hub Virtual Network GatewaySubnet CIDR"
    type = string
}    

variable "firewall_subnet"  {
    description = "Hub Virtual Network AzureFirewallSubnet CIDR"
    type = string
}    

