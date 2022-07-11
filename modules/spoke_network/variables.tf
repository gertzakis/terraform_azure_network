
variable "spoke_resource_group" {
  description = "Resource Group for Identity Vnet & subnets"
  type        = string
}
variable "spoke_location" {
  description = "Location for the Spoke Vnet"
  type        = string
}

variable "spoke_vnet_name" {
  description = "Identity Vnet name"
  type        = string
}
variable "spoke_vnet_cidr" {
  description = "Identity Vnet CIDR"
  type        = string
}

variable "spoke_vnet_subnets" {
  description = "Subnets of Spoke Vnet"
  type        = map(any)
}

variable "hub_vnet_id" {
  description = "ID of Hub Vnet"
  type        = string
}

variable "hub_resource_group" {
  description = "Hub resource group"
  type        = string
}

variable "hub_vnet_name" {
  description = "Hub Virtual Network name"
  type        = string
}

variable "spoke_udr_name" {
  description = "UDR name for this spoke"
  type        = string
}

variable "spoke_udr_routes" {
  description = "UDR routes for this spoke"
  type        = map(any)
}
