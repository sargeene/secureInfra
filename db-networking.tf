resource "azurerm_subnet" "this_db_subnet" {
  name                 = "${local.owner}-${var.db_subnet}-${local.environment}"
  resource_group_name  = azurerm_resource_group.this_rg.name
  virtual_network_name = azurerm_virtual_network.this_vnet.name
  address_prefixes     = ["10.0.3.0/24"]
  depends_on           = [azurerm_virtual_network.this_vnet]
}

resource "azurerm_private_endpoint" "this_db_private_endpoint" {
  name                = "${local.owner}-${var.db_private_endpoint}-${local.environment}"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
  subnet_id           = azurerm_subnet.this_db_subnet.id

  private_service_connection {
    name                           = var.db_private_service_connection
    private_connection_resource_id = azurerm_mysql_flexible_server.this_mysql_flexible_server.id
    subresource_names              = ["mysqlServer"]
    # This subresource_names = ["mysqlServer"] is a constant for database
    is_manual_connection = false
  }

  private_dns_zone_group {
    name                 = var.db_private_dns_zone_group
    private_dns_zone_ids = [azurerm_private_dns_zone.this_db_private_dns_zone.id]
  }
}

resource "azurerm_private_dns_zone" "this_db_private_dns_zone" {
  name                = var.db_private_dns_zone
  resource_group_name = azurerm_resource_group.this_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "this_db_private_dns_virtual_network_link" {
  name                  = var.db_private_dns_virtual_network_link
  resource_group_name   = azurerm_resource_group.this_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.this_db_private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.this_vnet.id
}