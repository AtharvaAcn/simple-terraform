terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate930"
    container_name       = "tfstate"
    key                  = "simple-vm.tfstate"
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}
