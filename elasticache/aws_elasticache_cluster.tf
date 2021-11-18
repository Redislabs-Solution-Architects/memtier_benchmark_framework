resource "aws_elasticache_cluster" "source" {
  count                = 0
  cluster_id           = format("redisgeek-%s", random_string.elasticache_suffix.result)
  replication_group_id = aws_elasticache_replication_group.example.id
  tags = {
    name = format("redisgeek-%s", random_string.elasticache_suffix.result)
  }
}