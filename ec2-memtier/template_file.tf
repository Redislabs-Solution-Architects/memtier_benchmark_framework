data "template_file" "user_data" {
  template = file("${path.module}/install_memtier_benchmark.yml")
}