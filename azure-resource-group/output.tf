output "random" {
  value = random_string.resource_group_name.id
}

output "resource_group" {
  value = azurerm_resource_group.redisgeek.name
}