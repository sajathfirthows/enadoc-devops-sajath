az aks get-credentials --resource-group rg-sajath-devops --name aks-sajath-devops-cluster

$evictedPods = kubectl get pods --field-selector=status.phase=Failed -o custom-columns=":metadata.name"

if ($evictedPods -eq $null -or $evictedPods.Count -eq 0) {
    Write-Host "No evicted pods found."
} else {   
    foreach ($pod in $evictedPods) {
        if ($pod -ne "") {
            kubectl delete pod $pod
            Write-Host "Deleted pod: $pod"
        }
    }
}
