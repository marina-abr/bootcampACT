terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstatedemo"
      container_name       = "tfstatecontainer"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
    
  features {}
}