module "ec2-memtier" {
  source            = "./ec2-memtier"
  security_group_id = module.elasticache.sg
}

module "elasticache" {
  source     = "./elasticache"
  aws_region = var.aws_region
}

module "rg" {
  source = "./azure-resource-group"
}

module "memtier" {
  source         = "./memtier"
  random_id      = module.rg.random
  resource_group = module.rg.resource_group
}

module "premium" {
  source         = "./premium"
  random_id      = module.rg.random
  resource_group = module.rg.resource_group
}

module "acre" {
  source         = "./acre"
  random_id      = module.rg.random
  resource_group = module.rg.resource_group
}

module "acref" {
  source         = "./acref"
  random_id      = module.rg.random
  resource_group = module.rg.resource_group
}