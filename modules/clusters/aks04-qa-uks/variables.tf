variable "resource_group" {
  description = "This is a consolidated name based on org, environment, region"
  type        = string
  default 	  = "gw-icap-uks-qa-main"
}

variable "region" {
  description = "The Azure Region"
  type        = string
  default     = "UKSOUTH"
}

variable "secret_sp_1" {
  description = "This is the name of the secret username for the service principle"
  type        = string
  default     = "spusername"
}

variable "secret_sp_2" {
  description = "This is the name of the secret password for the service principle"
  type        = string
  default     = "sppassword"
}

variable "cluster_name" {
  description = "This is a consolidated name based on org, environment, region"
  type        = string
  default     = "gw-icap-uks-qa-main"
}

variable "keyvault_name" {
  description = "This is the name for the Azure Key Vault"
  type        = string
  default     = "gw-tfstate-vault-13222"
}

variable "vault_resourcegroup_name" {
  description = "This is the resource group containing the Azure Key Vault"
  type        = string
  default     = "gw-icap-tfstate-11885"
}

variable "node_name" {
  description = "This is the resource group containing the Azure Key Vault"
  type        = string
  default     = "gwicapnode"
}