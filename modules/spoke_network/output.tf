output "spoke_subnet_id" {
  value =values(data.azurerm_subnet.subnets).*.id
}
