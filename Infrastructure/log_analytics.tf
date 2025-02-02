resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = "aks-log-workspace"
  location            = azurerm_resource_group.sajath_rg.location
  resource_group_name = azurerm_resource_group.sajath_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 90  # Optional: retention period
  tags = {
    environment = "Development"
  }
}

resource "azurerm_monitor_diagnostic_setting" "aks_diagnostics" {
  name                       = "aks-diagnostics"
  target_resource_id         = azurerm_kubernetes_cluster.sajath_aks.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}