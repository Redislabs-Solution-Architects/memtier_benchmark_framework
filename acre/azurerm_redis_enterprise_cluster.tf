resource "azurerm_redis_enterprise_cluster" "redisgeek" {
  name                = format("acre-%s", var.random_id)
  resource_group_name = data.azurerm_resource_group.redisgeek.name
  location            = data.azurerm_resource_group.redisgeek.location
  sku_name            = var.acre_sku
  tags                = data.azurerm_resource_group.redisgeek.tags
}