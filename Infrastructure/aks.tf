resource "azurerm_kubernetes_cluster" "sajath_aks" {
  name                = "aks-sajath-devops-cluster"
  location            = azurerm_resource_group.sajath_rg.location
  resource_group_name = azurerm_resource_group.sajath_rg.name
  dns_prefix          = "aks-sajath-devops-cluster"

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }

  tags = {
    environment = "test"
  }
}
