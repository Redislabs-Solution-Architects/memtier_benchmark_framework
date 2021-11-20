resource "azurerm_subnet" "redisgeek" {
  address_prefixes                               = ["10.0.1.0/24"]
  enforce_private_link_endpoint_network_policies = true
  name                                           = format("memtier-subnet-%s", var.random_id)
  resource_group_name                            = data.azurerm_resource_group.redisgeek.name
  virtual_network_name                           = azurerm_virtual_network.redisgeek.name
}