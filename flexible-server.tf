resource "azurerm_mysql_flexible_server" "this_mysql_flexible_server" {
  name                   = "${local.owner}-${var.this_mysql_fs}-${local.environment}"
  resource_group_name    = azurerm_resource_group.this_rg.name
  location               = azurerm_resource_group.this_rg.location
  administrator_login    = var.flexible_db_username
  administrator_password = azurerm_key_vault_secret.this_felxible_Server_secret.value
  backup_retention_days  = 7
  # delegated_subnet_id    = azurerm_subnet.this_flexible_server_subnet.id
  private_dns_zone_id = azurerm_private_dns_zone.this_db_private_dns_zone.id
  sku_name            = "GP_Standard_D2ds_v4"
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.this_manageidentity.id]
  }

  depends_on = [azurerm_private_dns_zone_virtual_network_link.this_db_private_dns_virtual_network_link]
}

resource "azurerm_mysql_flexible_database" "example" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.this_rg.name
  server_name         = azurerm_mysql_flexible_server.this_mysql_flexible_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  depends_on          = [azurerm_mysql_flexible_server.this_mysql_flexible_server]
}