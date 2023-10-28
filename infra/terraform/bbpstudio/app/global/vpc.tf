resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    name = var.name
    env = var.env
  }
}