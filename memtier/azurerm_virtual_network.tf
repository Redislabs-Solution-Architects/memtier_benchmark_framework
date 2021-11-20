resource "azurerm_virtual_network" "redisgeek" {
  name                = format("memtier-vnet-%s", var.random_id)
  depends_on          = [data.azurerm_resource_group.redisgeek]
  resource_group_name = data.azurerm_resource_group.redisgeek.name
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.redisgeek.location
  tags                = data.azurerm_resource_group.redisgeek.tags
}