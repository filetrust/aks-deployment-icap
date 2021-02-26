variable "azure_region" {
  description = "Metadata Azure Region"
  type        = string
  default     = "NORTHEUROPE"
}

variable "resource_group" {
  description = "Azure Resource Group"
  type        = string
  default     = "gw-icap-neu-keyvault"
}

variable "kv_name" {
  description = "The name of the key vault"
  type        = string
  default     = "icap-neu-keyvault"
}