provider "azurerm" {
  version = "=2.39.0"
  features {}
}

/*Ressource groupe*/
resource "azurerm_resource_group" "rg" {
  name     = var.ressource_group_name
  location = var.ressource_group_location
}

/* API */
resource "azurerm_app_service" "webapp" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
  https_only          = var.https_only
  site_config {
    always_on   = var.always_on
    ftps_state  = var.ftps_state
    java_version           = "1.8"
    java_container         = "tomcat"
    java_container_version = "9.0"
  }
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                 = var.plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  kind                 = var.kind
  # Reserved must be set to true for Linux App Service Plans
  reserved = true

  sku {
    tier     = var.sku_tier
    size     = var.sku_size
    capacity = var.sku_capacity
  }
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