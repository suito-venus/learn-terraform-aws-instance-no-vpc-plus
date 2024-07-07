terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.56"
    }
  }
  required_version = ">= 1.8.0"
}

provider "aws" {
  region  = "ap-northeast-1"
  default_tags {
    tags = {
      "Cost" : "suito"
      "Project" : "learn-terraform-aws-ec2-instance"
    }
  }
}


