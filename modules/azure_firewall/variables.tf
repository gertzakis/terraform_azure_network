
variable "hub_location" {
  description = "Location for hub resources"
  type        = string
}

variable "firewall_subnet_id" {
  description = "Azure Firewall Subnet for AzureFirewall resource"
  type        = string
}

variable "hub_resource_group" {
  description = "Hub resource group"
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
