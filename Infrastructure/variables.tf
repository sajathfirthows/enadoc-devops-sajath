variable "location" {
  description = "The Azure region for all resources"
  type        = string
  default     = "East US"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for the AKS node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
  default     = "myacr"
}
