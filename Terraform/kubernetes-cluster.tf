#
# Creates a managed Kubernetes cluster on Azure.
#
resource "azurerm_kubernetes_cluster" "aks101" {
    name                = "aks101"
    location            = var.location
    resource_group_name = azurerm_resource_group.sit722project.name
    dns_prefix          = "aks101dns"
    kubernetes_version  = var.kubernetes_version

    default_node_pool {
        name            = "default"
        node_count      = 1
        vm_size         = "Standard_DS2_v2"
    }

    #
    # Instead of creating a service principle have the system figure this out.
    #
    identity {
        type = "SystemAssigned"
    }    
}


# Output AKS credentials
output "kube_config" {
  value = azurerm_kubernetes_cluster.aks101.kube_config_raw
  sensitive = true
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks101.name
}
