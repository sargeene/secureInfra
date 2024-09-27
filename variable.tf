
variable "environment" {
  description = "solar-environment"
  type        = string
  default     = "secure"
}
variable "owner" {
  description = "solar-owner"
  type        = string
  default     = "ray"
}
variable "rg_name" {
  description = "value"
  type        = string
  default     = "rg"
}
variable "location" {
  description = "resource-location"
  type        = string
  default     = "uksouth"
}
variable "virtual_network" {
  description = "virtual network"
  type        = string
  default     = "vnet"
}
variable "network_subnet" {
  description = "network subnet"
  type        = string
  default     = "subnet"
}
variable "network_nic" {
  description = "network interface card"
  type        = string
  default     = "nic"
}
variable "win_vm_name" {
  description = "windows vm name"
  type        = string
  default     = "vm"
}
/* variable "win_vm_username" {
  description = "windows vm username"
  type        = string
  default     = "winvm-username"
} */
variable "key_vault" {
  description = "keyvault name"
  type        = string
  default     = "kv"
}
variable "vm_secret" {
  description = "vm secret keyvault name"
  type        = string
  default     = "vm-secret"
}
variable "flexible_server_secret" {
  description = "msql felxible secret keyvault name"
  type        = string
  default     = "msql-flexible-server-secret"
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
variable "this_flexible_database" {
  description = "mysql flexible server database name"
  type        = string
  default     = "this-mysql-flexible-database"
}

variable "db_subnet" {
  description = "database subnet"
  type        = string
  default     = "db-subnet"
}
variable "db_private_endpoint" {
  description = "db private endpoint"
  type        = string
  default     = "db-private-endpoint"
}
variable "db_private_service_connection" {
  description = "db private service connection"
  type        = string
  default     = "db-private-service-connection"
}
variable "db_private_dns_zone_group" {
  description = "db private service connection"
  type        = string
  default     = "db-private-dns-zone-group"
}
variable "db_private_dns_zone" {
  description = "db private dns zone"
  type        = string
  default     = "privatelink.mysql.database.azure.com"
}
variable "db_private_dns_virtual_network_link" {
  description = "db private dns virtual network link"
  type        = string
  default     = "db-private-virtual-network-link"
}
variable "kv_subnet" {
  description = "key vault subnet"
  type        = string
  default     = "kv-subnet"
}
variable "kv_private_endpoint" {
  description = "kv private endpoint"
  type        = string
  default     = "kv-private-endpoint"
}
variable "kv_private_service_connection" {
  description = "kv private service connection"
  type        = string
  default     = "kv-private-service-connection"
}
variable "kv_private_dns_zone_group" {
  description = "kv private dns zone group"
  type        = string
  default     = "kv-private-dns-zone-group"
}
variable "kv_private_dns_zone" {
  description = "kv private dns zone"
  type        = string
  default     = "privatelink.vaultcore.azure.net"
}
variable "kv_private_dns_zone_virtual_network_link" {
  description = "kv private dns zone virtual network link"
  type        = string
  default     = "kv-private-dns-zone-virtual-network-link"
}
variable "db_nsg" {
  description = "database nsg"
  type        = string
  default     = "db-nsg"
}
variable "db_ns_rule" {
  description = "database ns rule"
  type        = string
  default     = "db-ns-rule"
}
variable "vm_nsg" {
  description = "virtual machine nsg"
  type        = string
  default     = "vm-nsg"
}
variable "vm_inbound_ns_rule" {
  description = "virtual machine inbound ns rule"
  type        = string
  default     = "vm-inbound-ns-rule"
}
variable "vm_outbound_ns_rule" {
  description = "virtual machine outbound ns rule"
  type        = string
  default     = "vm-outbound-ns-rule"
}


