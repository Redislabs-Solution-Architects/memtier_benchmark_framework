resource "azurerm_network_interface" "redisgeek" {
  name                = format("redisgeek%s", random_string.resource_group_name.result)
  location            = var.location
  resource_group_name = azurerm_resource_group.redisgeek.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.redisgeek.id
    private_ip_address_allocation = "Dynamic"
  }
}