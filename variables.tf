variable "hub_resource_group" {
  description = "Hub resource group"
  type        = string
}
variable "hub_location" {
  description = "Location for hub resources"
  type        = string
}

variable "hub_vnet_name" {
  description = "Hub Virtual Network name"
  type        = string
}

variable "hub_vnet_cidr" {
  description = "Hub Virtual Network CIDR"
  type        = string
}

variable "gateway_subnet" {
  description = "Hub Virtual Network GatewaySubnet CIDR"
  type        = string
}


variable "firewall_subnet" {
  description = "Hub Virtual Network AzureFirewallSubnet CIDR"
  type        = string
}

variable "identity_resource_group" {
  description = "Resource Group for Identity Vnet & subnets"
  type        = string
}

variable "identity_vnet_name" {
  description = "Identity Vnet name"
  type        = string
}

variable "identity_vnet_location" {
  description = "Identity Vnet location/region"
  type        = string
}

variable "identity_vnet_cidr" {
  description = "Identity Vnet CIDR"
  type        = string
}

variable "identity_vnet_subnets" {
  description = "Subnets of Identity Vnet"
  type        = map(any)
}

variable "identity_udr_name" {
  description = "UDR name of Identity Vnet"
  type        = string
}

variable "identity_udr_routes" {
  description = "UDR routes of Identity Vnet"
  type        = map(any)
}

variable "er_gateway_pip_name" {
  description = "ER Public IP name"
  type        = string
}

variable "er_gateway_name" {
  description = "ER Gateway name"
  type        = string
}

variable "er_gateway_sku" {
  description = "ER Gateway SKU"
  type        = string
}


variable "vpn_gateway_pip_name" {
  description = "ER Public IP name"
  type        = string
}

variable "vpn_gateway_name" {
  description = "VPN Gateway name"
  type        = string
}

variable "vpn_gateway_sku" {
  description = "VPN Gateway SKU"
  type        = string
}

variable "firewall_pip_name" {
  description = "Firewall Public IP name"
  type        = string
}

variable "firewall_name" {
  description = "Firewall Name"
  type        = string
}

variable "firewall_sku_tier" {
  description = "Firewall SKU tier Standard/Premium"
  type        = string
  default     = "Standard"
}

variable "conn_sub_id" {
  description = "Connectivity Subscription ID"
  type        = string

}

variable "identity_sub_id" {
  description = "Identity Subscription ID"
  type        = string

}

