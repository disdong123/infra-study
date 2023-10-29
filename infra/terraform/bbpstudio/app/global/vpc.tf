resource "aws_vpc" "vpc_example" {
  cidr_block = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    name = var.creator
    env = var.env
  }
}

# aws_default_route_table 과 동일하게 vpc 가 만들어지면 기본으로 생성되는 sg 이고 terraform 이 관리하도록 지정합니다.
# 기본적으로 모든 ingress 는 unable, 모든 egress 는 enable 입니다.
resource "aws_default_security_group" "vpc_example_default_sg" {
  vpc_id = aws_vpc.vpc_example.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = var.creator
    env = var.env
  }
}