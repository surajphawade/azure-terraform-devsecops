module "azurerm_resource_group" {
    for_each = var.resource_group
    source = "../module/azurerm_resource_group"
    rg_name = each.value.rg_name
    location = each.value.location
}