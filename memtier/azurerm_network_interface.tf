resource "azurerm_network_interface" "redisgeek" {
  name                = format("memtier-nic-%s", var.random_id)
  location            = data.azurerm_resource_group.redisgeek.location
  resource_group_name = data.azurerm_resource_group.redisgeek.name

  ip_configuration {
    name                          = format("memtier-ip-config-%s", var.random_id)
    subnet_id                     = azurerm_subnet.redisgeek.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.redisgeek.id
  }
  tags = data.azurerm_resource_group.redisgeek.tags
}