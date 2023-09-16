# project configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

# resources
resource "aws_vpc" "task1-vpc" { # vpc
  cidr_block       = var.cidr
  instance_tenancy = "default"
  tags = {
    Name = "task1-vpc"
  }
}

resource "aws_subnet" "task1-subnet" { # public subnet
  cidr_block        = var.publicCIDR
  vpc_id            = aws_vpc.task1-vpc.id
  availability_zone = var.availability_zone

  tags = {
    Name = "task1-subnet"
  }
}

resource "aws_internet_gateway" "task1-gw" { # internet gateway
  vpc_id = aws_vpc.task1-vpc.id

  tags = {
    Name = "task1-gw"
  }
}

resource "aws_route_table" "task1-rt" { # route table
  vpc_id = aws_vpc.task1-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.task1-gw.id
  }

  tags = {
    Name = "task1-rt"
  }
}

resource "aws_route_table_association" "task1-rt-a" { # subnet and routing table association
  subnet_id      = aws_subnet.task1-subnet.id
  route_table_id = aws_route_table.task1-rt.id
}

resource "aws_instance" "test-web-server" { # ec2 instance
  ami                    = var.instance_AMI
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.task1-sg.id]

  tags = {
    Name = var.instance_tag
  }

  user_data = file("apache_server.sh")
}

resource "aws_security_group" "task1-sg" { # security group
  name        = "Task1 Security Group"
  description = "Security group created with Terraform"

  dynamic "ingress" { # inbound rules
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress { # outbound rules
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

