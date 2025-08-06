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
    subscription_id="501b9439-5db1-49ab-8931-8b0a015fb97b"
  features {}
}