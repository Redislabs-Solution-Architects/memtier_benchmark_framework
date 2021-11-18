locals {
  redisgeek_config = {
    hostname   = azurerm_redis_cache.redis.hostname
    access_key = azurerm_redis_cache.redis.primary_access_key
    port       = azurerm_redis_cache.redis.ssl_port
  }
}

output "redisgeek_config" {
  value     = local.redisgeek_config
  sensitive = true
}
