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


# Attaches the container registry to the cluster.
# See example here: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry#example-usage-attaching-a-container-registry-to-a-kubernetes-cluster
#
resource "azurerm_role_assignment" "role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.aks101.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.registry101.id
  skip_service_principal_aad_check = true
}

# Output AKS credentials
output "kube_config" {
  value = azurerm_kubernetes_cluster.aks101.kube_config_raw
  sensitive = true
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks101.name
}
