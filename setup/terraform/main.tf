# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.38.1"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstatedemo"
      container_name       = "tfstatecontainer"
      key                  = "terraform.tfstate"
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "minaRG3"
  location = "northeurope"
}

resource "azurerm_storage_account" "sa" {
  name                     = "pokeappsa040825"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    bypass = ["AzureServices"]
    default_action="Allow"
  }
}


resource "azurerm_service_plan" "sp" {
  name                = "poke-app-service-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_function_app" "funcApp" {
  name                = "poke-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  service_plan_id            = azurerm_service_plan.sp.id

  site_config {}
}