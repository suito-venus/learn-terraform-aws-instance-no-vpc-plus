terraform {
  backend "s3"{
  }
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
      "Cost" : var.cost_tag_value
      "Project" : var.project_name
    }
  }
}


