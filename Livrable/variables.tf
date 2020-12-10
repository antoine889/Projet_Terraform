/***************************************
*
*   Ressources
*
****************************************/

variable "ressource_group_name" {
  type    = string
  default = "rg5sig5"
  description = "Name of resource group"
}

variable "ressource_group_location" {
  type    = string
  default = "West Europe"
  description = "Location of resource group"
}

variable "storage_account_name" {
  type = string
  default = "hdinsightstormyanalyse"
  description = "Name of storage acount of Hd insight analysis"
}

variable "storage_container_name" {
  type = string
  default = "hdinsightmyanalyse"
  description = "Name of container of storage account below for hd insight analysis"
}

variable "storage_account_name_file" {
  type = string
  default = "filestorageg5esgi"
  description = "Name of storage account of server file"
}

variable "storage_container_name_file" {
  type = string
  default = "filestoragecontainerg5esgi"
  description = "Name of container of server file"
}
/***************************************
*
*   Serveurs
*
****************************************/

variable "server_mysql_name" {
  type    = string
  default = "servermysqlg5"
  description = "Name of server MySql"
}
variable "mysql_db_name" {
  type    = string
  default = "dbg5"
  description = "Name of Data Base"
}

variable "hdinsight_hbase_cluster_name" {
  type = string
  default = "hdiclustermyanalyse"
  description = "Name of cluster for analysis a data base"
}

variable "hbasecluster" {
  type = string
  default = "hdiclustermyanalyse"
  description = "Name of cluster for analysis a data base"
}

/*************************************
*
*   Services
*
**************************************/

variable "app_service_name" {
  type    = string
  default = "apigame"
  description = "Name of service API"
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
  description = "Name of server Linux for API"
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