resource "azurerm_subnet" "this_kv_subnet" {
  name                 = "${local.owner}-${var.kv_subnet}-${local.environment}"
  resource_group_name  = azurerm_resource_group.this_rg.name
  virtual_network_name = azurerm_virtual_network.this_vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}

resource "azurerm_private_endpoint" "this_kv_private_endpoint" {
  name                = "${local.owner}-${var.kv_private_endpoint}-${local.environment}"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
  subnet_id           = azurerm_subnet.this_kv_subnet.id

  private_service_connection {
    name                           = var.kv_private_service_connection
    private_connection_resource_id = azurerm_key_vault.this_keyvault.id
    subresource_names              = ["vault"]
    # This subresource_names is constant for keyvault
    is_manual_connection = false
  }

  private_dns_zone_group {
    name                 = var.kv_private_dns_zone_group
    private_dns_zone_ids = [azurerm_private_dns_zone.this_kv_private_dns_zone.id]
  }
}

resource "azurerm_private_dns_zone" "this_kv_private_dns_zone" {
  name = var.kv_private_dns_zone
  # This name is constant for keyvault
  resource_group_name = azurerm_resource_group.this_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "this_private_dns_zone_virtual_network_link" {
  name                  = var.kv_private_dns_zone_virtual_network_link
  resource_group_name   = azurerm_resource_group.this_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.this_kv_private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.this_vnet.id
}