provider "azurerm" {
  version = "=2.39.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.ressource_group_name
  location = var.ressource_group_location
}

resource "azurerm_mysql_server" "servermysql" {
  name                = var.server_mysql_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = "mysqladmin"
  administrator_login_password = "pass!@Groupe5#SI5"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "mysqldb" {
  name                = var.mysql_db_name
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.servermysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}