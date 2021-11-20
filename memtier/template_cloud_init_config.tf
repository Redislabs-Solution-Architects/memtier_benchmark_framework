data "template_file" "cloud_init_template" {
  template = file("${path.module}/install_memtier_benchmark.yml")
}

data "template_cloudinit_config" "cloud_init" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_init_template.rendered
  }
}