# EC2 用のプライベートキー
resource "tls_private_key" "learn-terraform-aws-ec2-instance-key" {
  algorithm = "ED25519"
}


# ローカルに Key pair を作成
# カレントディレクトリに作ってくれる？
locals {
  public_key_file  = "${var.ec2-key-name}.id_ed25519.pub"
  private_key_file = "${var.ec2-key-name}.id_ed25519"
}

resource "local_file" "learn-terraform-aws-ec2-instance-private-key" {
  filename = "${local.private_key_file}.id_ed25519"
  content  = tls_private_key.learn-terraform-aws-ec2-instance-key.private_key_openssh
  file_permission = "0600"
}

# 上記で作成した公開鍵をAWSのKey pairにインポート
resource "aws_key_pair" "learn-terraform-aws-ec2-instance-keypair" {
  key_name   = var.ec2-key-name
  public_key = tls_private_key.learn-terraform-aws-ec2-instance-key.public_key_openssh
}


resource "aws_instance" "app_server" {
  ami                    = "ami-0ee039144b67b3a1f"
  instance_type          = "t4g.nano"
  availability_zone      = var.az-a
  subnet_id              = aws_subnet.learn-terraform-aws-instance-subnet-a.id
  vpc_security_group_ids = [aws_security_group.handson_ec2_sg.id]
  iam_instance_profile   =  aws_iam_instance_profile.learn-terraform-aws-instance-profile.name
  tags = {
    Name = "ExampleAppServerInstance"
  }
}
