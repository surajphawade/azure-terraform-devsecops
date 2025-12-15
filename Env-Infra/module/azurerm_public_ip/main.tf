resource "azurerm_public_ip" "this" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location

  allocation_method   = "Static"
  sku                 = "Standard"
}

output "public_ip_id" {
  value = azurerm_public_ip.this.id
}
