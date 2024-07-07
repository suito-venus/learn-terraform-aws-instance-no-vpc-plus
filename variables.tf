variable "region" {
  default = "ap-northeast-1"
}

variable "az-a" {
  default = "ap-northeast-1a"
}

variable "az-c" {
  default = "ap-northeast-1c"
}

variable "vpc-name" {
  default = "learn-terraform-aws-instance-vpc"
}

variable "allowed_cidr" {
  default = null
}

variable "ec2-key-name" {
  default = "learn-terraform-aws-instance-keypair"
}