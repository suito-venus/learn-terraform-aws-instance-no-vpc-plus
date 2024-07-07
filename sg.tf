# 自分のパブリックIPを取得
data "http" "ifconfig" {
  url = "http://ipv4.icanhazip.com/"
}

locals {
  myip          = chomp(data.http.ifconfig.response_body)
  allowed_cidr  = (var.allowed_cidr == null) ? "${local.myip}/32" : var.allowed_cidr
}

resource "aws_security_group" "handson_ec2_sg" {
  name        = "learn-terraform-aws-instance-ec2-sg"
  description = "For EC2 Linux"
  vpc_id      = aws_vpc.learn-terraform-aws-instance-vpc.id
  tags = {
    Name = "terraform-handson-ec2-sg"
  }

  # インバウンドルール
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.allowed_cidr]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [local.allowed_cidr]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [local.allowed_cidr]
  }

  # アウトバウンドルール
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}