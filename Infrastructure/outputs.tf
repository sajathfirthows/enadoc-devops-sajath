output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.sajath_aks.name
  description = "Name of the AKS cluster"
}

output "aks_cluster_kube_config" {
  value       = azurerm_kubernetes_cluster.sajath_aks.kube_config_raw
  description = "Kubeconfig for AKS cluster access"
  sensitive   = true  # Mark as sensitive to avoid exposing credentials in output
}

output "resource_group_name" {
  value       = azurerm_resource_group.sajath_rg.name
  description = "Resource group name"
}
