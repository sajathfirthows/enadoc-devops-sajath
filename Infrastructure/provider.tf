terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # Use version 3.x or higher
    }
  }
}

provider "azurerm" {
  features {}
}