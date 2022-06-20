output "hub_vnet_id" {
  description = "The resource ID of the Hub's virtual network"
  value       = azurerm_virtual_network.hub_vnet.id
}

output "gateway_subnet_id" {
  description = "The resource ID of the virtual network gateway"
  value       = azurerm_subnet.hub_gateway_subnet.id
}

output "firewall_subnet_id" {
  description = "The public IP of the virtual network gateway"
  value       = azurerm_subnet.hub_firewall_subnet.id
}

