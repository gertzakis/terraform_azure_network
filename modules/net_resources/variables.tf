
variable "hub_location"{
    description = "Location for hub resources"
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

variable "hub_resource_group" {
    description = "Hub resource group"
    type = string
}
