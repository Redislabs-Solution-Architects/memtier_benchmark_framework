variable "random_id" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "sku_tier" {
  type        = string
  description = "The Azure Cache for Redis tier"
  default     = "Premium"
}