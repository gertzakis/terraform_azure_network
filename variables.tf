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

variable "gateways_resource_group" {
    description = "Resource Group for Virtual Network Gateways"
    type = string
}

variable "firewall_resource_group" {
    description = "Resource Group for AzureFirewall"
    type = string
}

variable "identity_resource_group" {
    description = "Resource Group for Identity Vnet & subnets"
    type = string
}

variable "identity_vnet_name" {
    description = "Identity Vnet name"
    type = string
}

variable "identity_vnet_location" {
    description = "Identity Vnet location/region"
    type = string
}

variable "identity_vnet_cidr" {
    description = "Identity Vnet CIDR"
    type = string
}
