terraform {
  required_version = ">= 1.0.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.67.0"
    }
  }
}
