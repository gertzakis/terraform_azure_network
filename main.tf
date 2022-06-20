terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias = "connectivity"

  features {}
  subscription_id = "952f2163-960c-48fb-867a-315f541fdd1e"
  tenant_id       = "76f9037d-0b73-4a41-bcac-cbccd1f1c412"
}

provider "azurerm" {
  alias = "identity"

  features {}
  subscription_id = "952f2163-960c-48fb-867a-315f541fdd1e"
  tenant_id       = "76f9037d-0b73-4a41-bcac-cbccd1f1c412"
}

provider "azurerm" {
  features {}
}
