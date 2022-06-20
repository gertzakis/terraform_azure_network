terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Virtual Network Gateway - ExpressRoute
resource "azurerm_public_ip" "hub_expressroute_gateway1_pip" {
  name                = "hub_expressroute_gateway1_pip"
  location            = var.hub_location
  resource_group_name = var.gateways_resource_group

  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_virtual_network_gateway" "hub_expressroute_gateway" {
  name                = "hub_express_gateway1"
  location            = var.hub_location
  resource_group_name = var.gateways_resource_group

  type = "ExpressRoute"

  active_active = false
  enable_bgp    = false
  sku           = "ErGw1AZ"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.hub_expressroute_gateway1_pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }
  depends_on = [azurerm_public_ip.hub_vpn_gateway1_pip]
}
# Virtual Network Gateway - VPN
resource "azurerm_public_ip" "hub_vpn_gateway1_pip" {
  name                = "hub_vpn_gateway1_pip"
  location            = var.hub_location
  resource_group_name = var.gateways_resource_group

  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_virtual_network_gateway" "hub_vnet_gateway" {
  name                = "hub_vpn_gateway1"
  location            = var.hub_location
  resource_group_name = var.gateways_resource_group

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.hub_vpn_gateway1_pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }
  depends_on = [azurerm_public_ip.hub_vpn_gateway1_pip, azurerm_virtual_network_gateway.hub_expressroute_gateway]
}

# Azure Firewall 
resource "azurerm_public_ip" "hub_firewall_pip" {
  name                = "hub_firewall_pip"
  location            = var.hub_location
  resource_group_name = var.firewall_resource_group

  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_firewall" "azure_firewall" {
  name                = "azure_firewall"
  location            = var.hub_location
  resource_group_name = var.firewall_resource_group

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = azurerm_public_ip.hub_firewall_pip.id
  }
}
