variable "project_name" {
  default = "learn-terraform-aws-ec2-instance"
}

variable "cost_tag_value"{
  default = "cost-responsible-dept-or-username"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "allowed_cidr" {
  default = null
}

locals {
  az-a = "${var.region}a"
}

locals  {
  az-c = "${var.region}c"
}

locals {
  vpc-name = "${var.project_name}-vpc"
}

locals {
  ec2-key-name = "${var.project_name}-keypair"
}
