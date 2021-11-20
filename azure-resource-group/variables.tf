variable "location" {
  type    = string
  default = "centralindia"
}

variable "tags" {
  description = "Key/value tags to assign to all resources."
  default = {
    solution = "memtier_benchmark_burn_in"
  }
  type = map(string)
}