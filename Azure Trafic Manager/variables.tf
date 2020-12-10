/***************************************
*
*   Ressources
*
****************************************/

variable "ressource_group_name" {
  type    = string
  default = "rg5sig5"
}

variable "ressource_group_location" {
  type    = string
  default = "West Europe"
}

variable "storage_account_name" {
  type = string
  default = "hdinsightstormyanalyse"
}

variable "storage_container_name" {
  type = string
  default = "hdinsightmyanalyse"
}

/***************************************
*
*   Serveurs
*
****************************************/

variable "server_mysql_name" {
  type    = string
  default = "servermysqlg5"
}
variable "mysql_db_name" {
  type    = string
  default = "dbg5"
}

variable "hdinsight_hbase_cluster_name" {
  type = string
  default = "hdiclustermyanalyse"
}

variable "hbasecluster" {
  type = string
  default = "hdiclustermyanalyse"
}

/*************************************
*
*   Services
*
**************************************/

variable "app_service_name" {
  type    = string
  default = "apigame"
}

variable "always_on" {
  type        = bool
  default     = true
  description = " Should the app be loaded at all times?"
}

variable "ftps_state" {
  type        = string
  default     = "FtpsOnly"
  description = "State of FTP / FTPS service for this App Service. Possible values include: AllAllowed, FtpsOnly and Disabled"
}

variable "https_only" {
  type        = bool
  default     = true
  description = "Can the App Service only be accessed via HTTPS?"
}



variable "plan_name" {
  type    = string
  default = "prod"
}

variable "sku_tier" {
  type        = string
  default     = "Standard"
  description = "Specifies the plan's pricing tier"
}

variable "sku_size" {
  type        = string
  default     = "S1"
  description = "Specifies the plan's instance size"
}

variable "sku_capacity" {
  type        = string
  default     = "2"
  description = "Specifies the number of workers associated with this app service plan"
}

variable "kind" {
  type        = string
  default     = "Linux"
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
}
