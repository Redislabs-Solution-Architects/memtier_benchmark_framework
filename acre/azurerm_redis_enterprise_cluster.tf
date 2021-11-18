resource "azurerm_redis_enterprise_cluster" "redisgeek" {
  name                = format("redisgeek-%s", random_string.redis_enterprise_name.result)
  resource_group_name = azurerm_resource_group.redisgeek.name
  location            = var.location
  sku_name            = var.acre_sku
  tags                = merge(var.tags, { owner = data.azurerm_client_config.current.client_id })
}