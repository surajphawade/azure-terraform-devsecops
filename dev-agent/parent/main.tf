resource "azurerm_resource_group" "this" {
  name     = "rg-devops-agent-dev"
  location = "East US"
}

module "devops_agent_vm" {
  source = "../module"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  vm_name             = "ado-agent-vm"
  admin_username      = "Adminsp"
  admin_password      = "Adminsp@1227#"
}
