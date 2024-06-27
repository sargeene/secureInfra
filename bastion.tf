resource "azurerm_subnet" "this_bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.this_rg.name
  virtual_network_name = azurerm_virtual_network.this_vnet.name
  address_prefixes     = ["10.0.5.0/24"]
}

resource "azurerm_public_ip" "this_azure_public_ip" {
  name                = "examplepip"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "this_azure_bastion_host" {
  name                = "examplebastion"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.this_bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.this_azure_public_ip.id
  }
}