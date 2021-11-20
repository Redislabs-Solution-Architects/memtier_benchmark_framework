resource "random_string" "resource_group_name" {
  length  = 4
  number  = false
  special = false
  upper   = false
}