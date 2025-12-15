module "azurerm_resource_group" {
    for_each = var.resource_group
    source = "../module/azurerm_resource_group"
    rg_name = each.value.rg_name
    location = each.value.location
}
module "azurerm_virtual_network" {
    depends_on = [ module.azurerm_resource_group ]
    for_each = var.virtual_network

    source = "../module/azurerm_virtual_network"
    vnet_name = each.value.vnet_name
    rg_name = each.value.rg_name
    location = each.value.location
    address_space = each.value.address_space


}