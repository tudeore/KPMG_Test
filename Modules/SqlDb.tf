resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sqlserver_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = var.mssql_version
  administrator_login          = var.sql_username
  administrator_login_password = var.sql_password
}

resource "azurerm_mssql_database" "sqldb" {
  name           = var.sqldb_name
  server_id      = azurerm_mssql_server.sqlserver.id
  sku_name       = var.sql_skuname
  depends_on = [
    azurerm_mssql_server.sqlserver
  ]


}

resource "azurerm_mssql_firewall_rule" "sql_firewall_rule" {
  name             = var.firewall_name
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = var.firewall_startIp
  end_ip_address   = var.firewall_endIp
}