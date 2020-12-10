provider "azurerm" {
  version = "=2.39.0"
  features {}
}

/*Ressource groupe*/
resource "azurerm_resource_group" "rg" {
  name     = var.ressource_group_name
  location = var.ressource_group_location
}

resource "azurerm_cdn_profile" "cdng5" {
  name                = "cdng5"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard_Verizon"
}

resource "azurerm_cdn_endpoint" "cdng5endpoint" {
  name                = "endpointcdn"
  profile_name        = azurerm_cdn_profile.cdng5.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  origin {
    name      = "apigame"
    host_name = "https://apigame.azurewebsites.net"
  }
}