terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
  use_cli = false
  // subscription_id = "00ad737d-c579-441c-8386-0551f3fc4bf9"
}
