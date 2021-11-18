variable "resource_group" {
  type        = string
  description = "The resource group"
  default     = ""
}

variable "location" {
  type        = string
  description = "The Azure region where all resources in this example should be created"
  default     = "centralindia"
}

variable "sku_tier" {
  type        = string
  description = "The Azure Cache for Redis tier"
  default     = "Premium"
}