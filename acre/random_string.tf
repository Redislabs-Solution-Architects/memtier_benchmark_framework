resource "random_string" "redis_enterprise_name" {
  length  = 4
  special = false
  upper   = false
}

resource "random_string" "resource_group_name" {
  length  = 4
  special = false
  upper   = false
}

resource "random_string" "acre_name" {
  length  = 4
  special = false
  upper   = false
}

resource "random_string" "key_vault_name" {
  length  = 8
  number  = false
  special = false
  upper   = false
}

resource "random_string" "secret_name" {
  length  = 8
  number  = false
  special = false
  upper   = false
}
