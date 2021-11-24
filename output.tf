locals {
  #  acre = {
  #    host       = module.acre.redisgeek_config.hostname
  #    port       = module.acre.redisgeek_config.port
  #    access_key = module.acre.redisgeek_config.access_key
  #  }
  #  acref = {
  #    host       = module.acref.redisgeek_config.hostname
  #    port       = module.acref.redisgeek_config.port
  #    access_key = module.acref.redisgeek_config.access_key
  #  }
  ec = {
    host       = module.elasticache.ec.hostname
    port       = module.elasticache.ec.port
    access_key = module.elasticache.ec.access_key
    pem = module.elasticache.pem
  }
  ec2-memtier = {
    user    = module.ec2-memtier.user
    host    = module.ec2-memtier.host
    program = module.ec2-memtier.program
  }
  #  premium = {
  #    access_key = module.premium.redisgeek_config.access_key
  #    host       = module.premium.redisgeek_config.hostname
  #    port       = module.premium.redisgeek_config.port
  #  }
  #  memtier = {
  #    user    = module.memtier.user
  #    host    = module.memtier.host
  #    program = module.memtier.program
  #  }
}

#output "acre" {
#  value     = jsonencode(local.acre)
#  sensitive = true
#}
#
#output "acref" {
#  value     = jsonencode(local.acref)
#  sensitive = true
#}

output "ec" {
  value     = jsonencode(local.ec)
  sensitive = true
}
output "ec2-memtier" {
  value     = jsonencode(local.ec2-memtier)
  sensitive = true
}

#output "memtier" {
#  value = jsonencode(local.memtier)
#}
#
#output "premium" {
#  value     = jsonencode(local.premium)
#  sensitive = true
#}