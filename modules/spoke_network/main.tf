terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

resource "azurerm_resource_group" "spoke_vnet_rg" {
  provider = azurerm.spoke
  name     = var.spoke_resource_group
  location = var.spoke_location
}

# Spoke Vnet
resource "azurerm_virtual_network" "spoke_vnet" {
  provider            = azurerm.spoke
  name                = var.spoke_vnet_name
  location            = azurerm_resource_group.spoke_vnet_rg.location
  resource_group_name = azurerm_resource_group.spoke_vnet_rg.name
  address_space       = [var.spoke_vnet_cidr]

}

resource "azurerm_virtual_network_peering" "spoke_hub_peer" {
  provider                  = azurerm.spoke
  name                      = "${var.spoke_vnet_name}-hub-peer"
  resource_group_name       = azurerm_resource_group.spoke_vnet_rg.name
  virtual_network_name      = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id = var.hub_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = true
  depends_on                   = [azurerm_virtual_network.spoke_vnet]
}

resource "azurerm_virtual_network_peering" "hub_spoke_peer" {
  provider                     = azurerm.connectivity
  name                         = "hub-${var.spoke_vnet_name}-peer"
  resource_group_name          = var.hub_resource_group
  virtual_network_name         = var.hub_vnet_name
  remote_virtual_network_id    = azurerm_virtual_network.spoke_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
  depends_on                   = [azurerm_virtual_network.spoke_vnet]
}
