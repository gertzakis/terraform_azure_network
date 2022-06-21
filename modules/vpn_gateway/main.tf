terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Virtual Network Gateway - VPN Public IP
resource "azurerm_public_ip" "hub_vpn_gateway1_pip" {
  name                = var.vpn_gateway_pip_name
  location            = var.hub_location
  resource_group_name = var.hub_resource_group

  allocation_method = "Static"
  sku = "Standard"
}

# Virtual Network Gateway - VPN
resource "azurerm_virtual_network_gateway" "hub_vnet_gateway" {
  name                = var.vpn_gateway_name
  location            = var.hub_location
  resource_group_name = var.hub_resource_group

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = var.vpn_gateway_sku
  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.hub_vpn_gateway1_pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }
  depends_on = [azurerm_public_ip.hub_vpn_gateway1_pip]
}
