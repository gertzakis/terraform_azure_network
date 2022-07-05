terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Hub Resource Group
resource "azurerm_resource_group" "hub_vnet_rg" {
  name     = var.hub_resource_group
  location = var.hub_location
}

# Hub Vnet
resource "azurerm_virtual_network" "hub_vnet" {
  name                = var.hub_vnet_name
  location            = azurerm_resource_group.hub_vnet_rg.location
  resource_group_name = azurerm_resource_group.hub_vnet_rg.name
  address_space       = [var.hub_vnet_cidr]
}

# Firewall Subnet
resource "azurerm_subnet" "hub_firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.hub_vnet_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = [var.firewall_subnet]
}

# Gateway Subnet
resource "azurerm_subnet" "hub_gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.hub_vnet_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = [var.gateway_subnet]
}

# Bastion Subnet
resource "azurerm_subnet" "hub_bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.hub_vnet_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = [var.bastion_subnet]
}

# Route table for this Spoke Vnet
resource "azurerm_route_table" "gateway_udr" {
  name                          = "${azurerm_subnet.hub_gateway_subnet.name}-udr"
  location                      = azurerm_resource_group.hub_vnet_rg.location
  resource_group_name           = azurerm_resource_group.hub_vnet_rg.name
  disable_bgp_route_propagation = false
}

# Route table association for Gateway subnet
resource "azurerm_subnet_route_table_association" "gateway_udr_association" {
  subnet_id      = azurerm_subnet.hub_gateway_subnet.id
  route_table_id = azurerm_route_table.gateway_udr.id
}
