
variable "hub_location"{
    description = "Location for hub resources"
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

variable "gateway_subnet_id" {
    description = "Gateway Subnet for Virtual Network Gateways"
    type = string
}

variable "firewall_subnet_id" {
    description = "Azure Firewall Subnet for AzureFirewall resource"
    type = string
}
