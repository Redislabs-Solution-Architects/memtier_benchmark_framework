locals {
  host    = azurerm_linux_virtual_machine.redisgeek.public_ip_address
  user    = "adminuser"
  program = "/usr/local/bin/memtier_benchmark"
}

output "host" {
  value       = local.host
  description = "Public IP for memtier instance"
}

output "user" {
  value       = local.user
  description = "user with access to host"
}

output "program" {
  value       = local.program
  description = "Absolute path to program on host"
}