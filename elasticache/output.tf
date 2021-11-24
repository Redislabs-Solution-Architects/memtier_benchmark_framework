locals {
  ec = {
    access_key = ""
    hostname   = aws_elasticache_replication_group.example.primary_endpoint_address
    port       = aws_elasticache_replication_group.example.port
  }
}

output "sg" {
  value = aws_security_group.redisgeek.id
}

output "ec" {
  value = local.ec
}