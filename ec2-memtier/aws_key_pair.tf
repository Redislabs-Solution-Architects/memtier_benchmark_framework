resource "aws_key_pair" "local_key" {
  key_name   = format("redisgeek-%s", random_string.ssh_key_name.result)
  public_key = file("~/.ssh/id_rsa.pub")
}