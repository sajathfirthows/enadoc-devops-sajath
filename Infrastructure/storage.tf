resource "azurerm_storage_account" "sajath_storage" {
  name                     = "storagesajathdevops"
  resource_group_name      = azurerm_resource_group.sajath_rg.name
  location                 = azurerm_resource_group.sajath_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}