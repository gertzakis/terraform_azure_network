

# Terraform_Azure_Network

Deploys a Hub and Spoke topology with ExpressRoute Gateway, VPN Gateway And AzureFirewall.

`main.tf` configuration of the terraform providers, using aliases per Azure subscription.

`hub_spoke_topology.tf` Main logic of the solution, calls different modules for specific functionality. All variables are declared in `variables.tf` and values in `terraform.tfvars`.

## Modules 
Every module is created to do one job and variables that are used inside the modules are passed from the root one.

`hub_network` deploys the Hub resource group with Virtual Network and the necessary subnets for the Hub (GatewaySubnet, AzureFirewallSubnet).

`er_gateway` deploys the ExpressRoute Gateway with his necessary public IP.

`vpn_gateway` deploys the VPN Gateway with his necessary public IP.

`azure_firewall` deploys the AzureFirewall with his necessary public IP.

`spoke_network` deploys another Vnet, with subnets, sNSG for every subnet and their associations, and one UDR associated with all spoke subnets. 
**NSGs and UDRs are empty** of rules and routes respectively.
