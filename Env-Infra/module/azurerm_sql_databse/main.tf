resource "azurerm_mssql_database" "this" {
  name      = var.db_name
  server_id = var.server_name
  sku_name  = "Basic"
}
