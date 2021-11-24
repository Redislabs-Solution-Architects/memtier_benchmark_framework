resource "aws_instance" "memtier" {
  ami                         = var.linux_ami
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.local_key.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  user_data                   = data.template_file.user_data.rendered
}