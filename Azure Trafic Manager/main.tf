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

resource "random_id" "server" {
  keepers = {
    azi_id = 1
  }

  byte_length = 8
}

resource "azurerm_traffic_manager_profile" "traffic" {
  name                = random_id.server.hex
  resource_group_name = azurerm_resource_group.rg.name

  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = random_id.server.hex
    ttl           = 100
  }

  monitor_config {
    protocol                     = "http"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_traffic_manager_endpoint" "example" {
  name                = random_id.server.hex
  resource_group_name = azurerm_resource_group.rg.name
  profile_name        = azurerm_traffic_manager_profile.traffic.name
  target_resource_id  = azurerm_app_service.webapp.id
  target              = "https://apigame.azurewebsites.net"
  type                = "azureEndpoints"
  weight              = 100
}