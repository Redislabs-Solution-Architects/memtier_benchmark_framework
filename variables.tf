variable "aws_region" {
  description = "Region into which to deploy the EC2 instance"
  default     = "ap-south-1"
}

variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  default     = "public"
  type        = string
}