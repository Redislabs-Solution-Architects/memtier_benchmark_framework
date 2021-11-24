variable "aws_region" {
  description = "Region into which to deploy the EC2 instance"
  default     = "ap-south-1"
}

variable "linux_ami" {
  description = "Linux ami to use :: Should work with Redis Labs Sales Account"
  default     = "ami-041db4a969fe3eb68"
}

variable "instance_type" {
  description = "(Optional) instance type to use. Default: t3.micro"
  default     = "m5.12xlarge"
}

variable "ssh_key_name" {
  description = "name of ssh key to be added to instance"
}

variable "security_group_id" {
  description = "Id of the security group applied to the instance"
}

variable "subnet_id" {
  description = "(Optional) VPC Subnet ID to launch in"
  default     = ""
}