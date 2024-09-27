resource "azurerm_virtual_network" "this_vnet" {
  name                = "${local.owner}-${var.virtual_network}-${local.environment}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
}

resource "azurerm_subnet" "this_subnet" {
  name                 = "${local.owner}-${var.network_subnet}-${local.environment}"
  resource_group_name  = azurerm_resource_group.this_rg.name
  virtual_network_name = azurerm_virtual_network.this_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "this_nic" {
  name                = "${local.owner}-${var.network_nic}-${local.environment}"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.this_subnet.id
    private_ip_address_allocation = "Dynamic"
    private_ip_address            = "10.0.2.9"
    #The first 1-4 Ip address are reserved so start from 10.0.11.5 and above 5. i.e 10.0.11.6, 10.0.11.7 and all 
  }
}