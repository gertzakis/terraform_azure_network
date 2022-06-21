
variable "hub_location" {
  description = "Location for hub resources"
  type        = string
}

variable "gateway_subnet_id" {
  description = "Gateway Subnet for Virtual Network Gateways"
  type        = string
}

variable "hub_resource_group" {
  description = "Hub resource group"
  type        = string
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
