variable "aws_region" {
  description = "Region into which to deploy the EC2 instance"
}

variable "elasticache_node_type" {
  default     = "cache.r6g.2xlarge"
  description = "Elasticache node type. Default: cache.t3.micro"
}