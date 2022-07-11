output "spoke_subnet_id" {
  value = values(azurerm_subnet.spoke_subnet).*.id
}
