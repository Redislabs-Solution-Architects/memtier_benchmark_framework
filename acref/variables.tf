variable "acre_sku" {
  type    = string
  default = "EnterpriseFlash_F1500-9"
}

variable "azure_redis_enterprise_database_clustering_policy" {
  type    = string
  default = "EnterpriseCluster"
}

variable "location" {
  type    = string
  default = "centralindia"
}

variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  default     = "public"
  type        = string
}

variable "tags" {
  description = "Key/value tags to assign to all resources."
  default     = {}
  type        = map(string)
}