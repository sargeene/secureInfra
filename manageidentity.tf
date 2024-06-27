#Resource for managed Identity
resource "azurerm_user_assigned_identity" "this_manageidentity" {
  location            = azurerm_resource_group.this_rg.location
  name                = "user-assigned-identity"
  resource_group_name = azurerm_resource_group.this_rg.name
}
resource "azurerm_role_assignment" "this_kv_role" {
  scope                = azurerm_key_vault.this_keyvault.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.this_manageidentity.principal_id
}
resource "azurerm_role_assignment" "this_flexible_server_role" {
  scope                = azurerm_mysql_flexible_server.this_mysql_flexible_server.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.this_manageidentity.principal_id
}
resource "azurerm_role_assignment" "this_win_vm_role" {
  scope                = azurerm_windows_virtual_machine.this_winvm.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azurerm_user_assigned_identity.this_manageidentity.principal_id
}
