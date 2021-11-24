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

output "key" {
  value = aws_key_pair.generated_key.key_name
}

output "pem" {
  value = tls_private_key.example.private_key_pem
}

output "ec" {
  value = local.ec
}