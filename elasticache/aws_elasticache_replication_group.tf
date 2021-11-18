resource "aws_elasticache_replication_group" "example" {
  security_group_ids            = [aws_security_group.redisgeek.id]
  engine                        = "redis"
  replication_group_id          = "tf-rep-group-1"
  replication_group_description = "test description"
  node_type                     = var.elasticache_node_type
  parameter_group_name          = "default.redis6.x.cluster.on"
  port                          = 6379
  automatic_failover_enabled    = true
  cluster_mode {
    replicas_per_node_group = 2
    num_node_groups         = 30
  }
}