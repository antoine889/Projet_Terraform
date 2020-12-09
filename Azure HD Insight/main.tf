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

resource "azurerm_storage_account" "sg" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sgcontainer" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sg.name
  container_access_type = "private"
}

resource "azurerm_hdinsight_hbase_cluster" "hbasecluster" {
  name                = var.hdinsight_hbase_cluster_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cluster_version     = "3.6"
  tier                = "Standard"

  component_version {
    hbase = "1.1"
  }

  gateway {
    enabled  = true
    username = "hdadmin"
    password = "pass!@Groupe5#SI5"
  }

  storage_account {
    storage_container_id = azurerm_storage_container.sgcontainer.id
    storage_account_key  = azurerm_storage_account.sg.primary_access_key
    is_default           = true
  }

  roles {
    head_node {
      vm_size  = "Standard_D3_V2"
      username = "esgiuser"
      password = "pass!@Groupe5#SI5"
    }

    worker_node {
      vm_size               = "Standard_D3_V2"
      username              = "esgiuser"
      password              = "pass!@Groupe5#SI5"
      target_instance_count = 3
    }

    zookeeper_node {
      vm_size  = "Standard_D3_V2"
      username = "esgiuser"
      password = "pass!@Groupe5#SI5"
    }
  }
}