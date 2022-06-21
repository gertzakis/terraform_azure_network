terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Azure Firewall - Public IP
resource "azurerm_public_ip" "hub_firewall_pip" {
  name                = var.firewall_pip_name
  location            = var.hub_location
  resource_group_name = var.hub_resource_group

  allocation_method = "Static"
  sku = "Standard"
}

# Azure Firewall
resource "azurerm_firewall" "azure_firewall" {
  name                = var.firewall_name
  location            = var.hub_location
  resource_group_name = var.hub_resource_group

  sku_name = "AZFW_VNet"
  sku_tier = var.firewall_sku_tier

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = azurerm_public_ip.hub_firewall_pip.id
  }
}
