resource "azurerm_public_ip" "redisgeek" {
  name                = format("memtier-public-ip-%s", var.random_id)
  resource_group_name = data.azurerm_resource_group.redisgeek.name
  location            = data.azurerm_resource_group.redisgeek.location
  allocation_method   = "Static"

  tags = data.azurerm_resource_group.redisgeek.tags
}