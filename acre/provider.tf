terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  environment = var.cloud_name
  features {
  }
}
