terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider per subscription
provider "azurerm" {
  alias = "connectivity"

  features {}
  # Use environment variable TF_VAR_conn_sub_id
  subscription_id = var.conn_sub_id
}

provider "azurerm" {
  alias = "identity"

  features {}
  # Use environment variable TF_VAR_identity_sub_id
  subscription_id =  var.identity_sub_id
}

provider "azurerm" {
  features {}
}
