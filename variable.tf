
variable "environment" {
    description = "solar-environment"
    type = string
    default = "secure"  
}
variable "owner" {
    description = "solar-owner"
    type = string
    default = "rasheed"  
}
variable "rg_name" {
    description = "value"
    type = string
    default = "rg"  
}
variable "location" {
    description = "resource-location"
    type = string
    default = "uksouth" 
}
variable "virtual_network" {
    description = "virtual network"
    type = string
    default = "vnet" 
}
variable "network_subnet" {
    description = "network subnet"
    type = string
    default = "subnet" 
}
variable "network_nic" {
    description = "network interface card"
    type = string
    default = "nic" 
}
variable "win_vm_name" {
    description = "windows vm name"
    type = string
    default = "winvm" 
}
variable "win_vm_username" {
    description = "windows vm username"
    type = string
    default = "winvm-username" 
}
variable "key_vault" {
    description = "keyvault name"
    type = string
    default = "kv" 
}
variable "vm_secret" {
    description = "vm secret keyvault name"
    type = string
    default = "vm-secret" 
}
variable "flexible_server_secret" {
  description = "msql felxible secret keyvault name"
  type        = string
  default     = "msql-flexible-server-secret"
}
variable "this_flexible_database" {
  description = "flexible database name"
  type        = string
  default     = "flexible-database"
}
variable "this_mysql_fs" {
  description = "mysql flexible server name"
  type        = string
  default     = "mysql-flexible-server"
}
variable "flexible_db_username" {
  description = "flexible database admin login username"
  type        = string
  default     = "psqladmin"
}

