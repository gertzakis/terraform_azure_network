terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Resource group for this Spokes's Vnets
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

# Spoke to Hub peering
resource "azurerm_virtual_network_peering" "spoke_hub_peer" {
  depends_on                   = [azurerm_virtual_network.spoke_vnet]
  provider                  = azurerm.spoke
  
  name                      = "${var.spoke_vnet_name}-hub-peer"
  resource_group_name       = azurerm_resource_group.spoke_vnet_rg.name
  virtual_network_name      = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id = var.hub_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = true
}

# Hub to Spoke peering
resource "azurerm_virtual_network_peering" "hub_spoke_peer" {
  depends_on                   = [azurerm_virtual_network.spoke_vnet]
  provider                     = azurerm.connectivity
  
  name                         = "hub-${var.spoke_vnet_name}-peer"
  resource_group_name          = var.hub_resource_group
  virtual_network_name         = var.hub_vnet_name
  remote_virtual_network_id    = azurerm_virtual_network.spoke_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

# NSGs for every subnet in this Spoke
resource "azurerm_network_security_group" "spoke_nsg" {
  provider = azurerm.spoke

  for_each            = var.spoke_vnet_subnets
  name                = each.value["nsg_name"]
  location            = azurerm_resource_group.spoke_vnet_rg.location
  resource_group_name = azurerm_resource_group.spoke_vnet_rg.name
}

# Spoke Subnets
resource "azurerm_subnet" "spoke_subnet" {
  depends_on           = [azurerm_virtual_network.spoke_vnet]
  provider = azurerm.spoke

  for_each             = var.spoke_vnet_subnets
  name                 = each.value["name"]
  address_prefixes     = [each.value["address_prefixes"]]
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  resource_group_name  = azurerm_resource_group.spoke_vnet_rg.name
}

# NSGs with Subnets associations
resource "azurerm_subnet_network_security_group_association" "spoke_nsg_associations" {
  depends_on = [
    azurerm_subnet.spoke_subnet,
    azurerm_network_security_group.spoke_nsg
  ]
  provider = azurerm.spoke

  for_each                  = { for k, v in var.spoke_vnet_subnets : k => v if lookup(v, "nsg_name", "") != "" }
  subnet_id                 = azurerm_subnet.spoke_subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.spoke_nsg[each.key].id
}

# Route table for this Spoke Vnet
resource "azurerm_route_table" "spoke_udr" {
  provider = azurerm.spoke

  name                          = "${azurerm_virtual_network.spoke_vnet.name}-udr"
  location                      = azurerm_resource_group.spoke_vnet_rg.location
  resource_group_name           = azurerm_resource_group.spoke_vnet_rg.name
  disable_bgp_route_propagation = true
}

# Route table association for every subnet in Spoke
resource "azurerm_subnet_route_table_association" "udr_association" {
  provider = azurerm.spoke

  for_each       = { for k, v in var.spoke_vnet_subnets : k => v }
  subnet_id      = azurerm_subnet.spoke_subnet[each.key].id
  route_table_id = azurerm_route_table.spoke_udr.id
}
