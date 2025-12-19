module "azurerm_resource_group" {
  for_each = var.resource_group
  source   = "../module/azurerm_resource_group"

  rg_name  = each.value.rg_name
  location = each.value.location
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  for_each   = var.virtual_network
  source     = "../module/azurerm_virtual_network"

  vnet_name     = each.value.vnet_name
  rg_name       = each.value.rg_name
  location      = each.value.location
  address_space = each.value.address_space
}

module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  for_each   = var.subnet
  source     = "../module/azurerm_subnet"

  subnet_name      = each.value.subnet_name
  address_prefixes = each.value.address_prefixes
  vnet_name        = each.value.vnet_name
  rg_name          = each.value.rg_name
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group]
  for_each   = var.public_ip
  source     = "../module/azurerm_public_ip"

  name     = each.value.name
  rg_name  = each.value.rg_name
  location = each.value.location
}

module "azurerm_bastion" {
  depends_on = [ module.azurerm_public_ip, module.azurerm_subnet ]
  for_each = var.bastion
  source   = "../module/azurerm_bastion"

  name         = each.value.name
  rg_name      = each.value.rg_name
  location     = each.value.location
  subnet_id    = module.azurerm_subnet[each.value.subnet_key].subnet_id
  public_ip_id = module.azurerm_public_ip[each.value.pip_key].public_ip_id
}

module "azurerm_virtual_machine" {
  depends_on = [module.azurerm_subnet]
  for_each   = var.virtual_machine
  source     = "../module/azurerm_virtual_machine"

  vm_name        = each.value.vm_name
  rg_name        = each.value.rg_name
  location       = each.value.location
  subnet_id      = module.azurerm_subnet[each.value.subnet_key].subnet_id
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
}
module "azurerm_storage_account" {
  depends_on = [module.azurerm_resource_group]
  for_each   = var.storage_account
  source     = "../module/azurerm_storage_account"

  name     = each.value.name
  rg_name  = each.value.rg_name
  location = each.value.location
}

module "azurerm_storage_container" {
  depends_on = [module.azurerm_storage_account]
  for_each   = var.storage_container
  source     = "../module/azurerm_storage_container"

  name            = each.value.name
  storage_account = each.value.storage_account
}

module "azurerm_sql_server" {
  depends_on = [module.azurerm_resource_group]
  for_each   = var.sql_server
  source     = "../module/azurerm_sql_server"

  server_name    = each.value.server_name
  rg_name        = each.value.rg_name
  location       = each.value.location
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
}

module "azurerm_sql_database" {
  depends_on = [module.azurerm_sql_server]
  for_each   = var.sql_database
  source     = "../module/azurerm_sql_databse"

  db_name     = each.value.db_name
  server_name = module.azurerm_sql_server[each.value.server_key].server_id
}

module "azurerm_key_vault" {
  depends_on = [module.azurerm_resource_group]
  for_each   = var.key_vault
  source     = "../module/azurerm_key_vault"

  name     = each.value.name
  rg_name  = each.value.rg_name
  location = each.value.location
}
