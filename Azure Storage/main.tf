provider "azurerm" {
  version = "=2.39.0"
  features {}
}

/*Ressource groupe*/
resource "azurerm_resource_group" "rg" {
  name     = var.ressource_group_name
  location = var.ressource_group_location
}


/*Storage account*/
resource "azurerm_storage_account" "sg" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
/*Storage container*/
resource "azurerm_storage_container" "sgcontainer" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sg.name
  container_access_type = "private"
}


resource "azurerm_storage_blob" "storagefile" {
  name                   = "Sujet.pdf"
  storage_account_name   = azurerm_storage_account.sg.name
  storage_container_name = azurerm_storage_container.sgcontainer.name
  type                   = "Block"
  source                 = "Sujet.pdf"
}