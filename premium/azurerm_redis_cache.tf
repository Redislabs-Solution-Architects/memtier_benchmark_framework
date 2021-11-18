resource "azurerm_redis_cache" "redis" {
  name                = format("redisgeek%s", random_string.resource_group_name.result)
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
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