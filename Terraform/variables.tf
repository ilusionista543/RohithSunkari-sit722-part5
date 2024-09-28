# Sets global variables for this Terraform project.


variable "resource_group_name" {
  default = "sit722project"
}

variable "cluster_name" {
  default = "aks101"
}

variable "acr_name" {
  default = "registry101'
}

variable location {
  default = "australiasoutheast"
}

variable kubernetes_version {    
  default = "1.30.2"
}