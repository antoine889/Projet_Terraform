variable "server_mysql_name" {
  type    = string
  default = "servermysqlg55"
}

variable "ressource_group_name" {
  type    = string
  default = "rg5sig5"
}

variable "ressource_group_location" {
  type    = string
  default = "West Europe"
}

variable "mysql_db_name" {
  type    = string
  default = "dbg5"
}
variable "storage_account_name" {
  type = string
  default = "hdinsightstormyanalyse"
}

variable "storage_container_name" {
  type = string
  default = "hdinsightmyanalyse"
}

variable "hdinsight_hbase_cluster_name" {
  type = string
  default = "hdiclustermyanalyse"
}

variable "hbasecluster" {
  type = string
  default = "hdiclustermyanalyse"
}