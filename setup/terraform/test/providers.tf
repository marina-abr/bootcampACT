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
      storage_account_name = "tfstatedemo124"
      container_name       = "tfstatecontainer"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
    subscription_id="00620f82-d8b3-49d6-8bc2-5cacf4a06fec"
  features {}
}
