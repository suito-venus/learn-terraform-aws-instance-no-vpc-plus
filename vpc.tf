resource "aws_vpc" "learn-terraform-aws-instance-vpc" {
  cidr_block = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"
  tags = {
    "Name" : var.vpc-name
  }
}

resource "aws_internet_gateway" "learn-terraform-aws-instance-gateway" {
  vpc_id = aws_vpc.learn-terraform-aws-instance-vpc.id
}

resource "aws_route_table" "learn-terraform-aws-instance-route-table" {
  vpc_id = aws_vpc.learn-terraform-aws-instance-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.learn-terraform-aws-instance-gateway.id
  }
}

resource "aws_subnet" "learn-terraform-aws-instance-subnet-a" {
  vpc_id = aws_vpc.learn-terraform-aws-instance-vpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone = var.az-a
  map_public_ip_on_launch = true
}

resource "aws_route_table_association" "learn-terraform-aws-instance-route-table-association-1" {
  subnet_id = aws_subnet.learn-terraform-aws-instance-subnet-a.id
  route_table_id = aws_route_table.learn-terraform-aws-instance-route-table.id
}

resource "aws_subnet" "learn-terraform-aws-instance-subnet-c" {
  vpc_id = aws_vpc.learn-terraform-aws-instance-vpc.id
  cidr_block = "192.168.2.0/24"
  availability_zone = var.az-c
  map_public_ip_on_launch = true
}

resource "aws_route_table_association" "learn-terraform-aws-instance-route-table-association-2" {
  subnet_id = aws_subnet.learn-terraform-aws-instance-subnet-c.id
  route_table_id = aws_route_table.learn-terraform-aws-instance-route-table.id
}