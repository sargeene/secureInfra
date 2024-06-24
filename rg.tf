resource "azurerm_resource_group" "this_rg" {
  name     = "${local.owner}-${var.rg_name}-${local.environment}"
  location = var.location
}