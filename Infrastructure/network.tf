resource "azurerm_virtual_network" "sajath_vnet" {
  name                = "vnet-sajath-devops"
  location            = azurerm_resource_group.sajath_rg.location
  resource_group_name = azurerm_resource_group.sajath_rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.sajath_rg.name
  virtual_network_name = azurerm_virtual_network.sajath_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}



resource "azurerm_network_security_group" "aks_nsg" {
  name                = "aks-nsg"
  location            = azurerm_resource_group.sajath_rg.location
  resource_group_name = azurerm_resource_group.sajath_rg.name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow_kubernetes_api"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
