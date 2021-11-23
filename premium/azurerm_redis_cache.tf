resource "azurerm_redis_cache" "redis" {
  name                = format("acrp-%s", var.random_id)
  resource_group_name = data.azurerm_resource_group.redisgeek.name
  location            = data.azurerm_resource_group.redisgeek.location
  capacity            = 4
  family              = "P"
  sku_name            = var.sku_tier
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
  redis_version       = 6
  shard_count         = 10

  redis_configuration {
  }
}