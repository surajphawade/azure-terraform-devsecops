provider "azurerm" {
  features {}
  subscription_id = "00ad737d-c579-441c-8386-0551f3fc4bf9"
}

resource "azurerm_resource_group" "rg" {
  name     = "tt-rg-demo"
  location = "East US"
}
