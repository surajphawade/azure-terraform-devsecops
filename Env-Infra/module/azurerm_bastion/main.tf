resource "azurerm_bastion_host" "this" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_id
  }
}
