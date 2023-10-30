resource "aws_vpc" "vpc_template" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    creator = var.tags.creator
    env = var.tags.env
  }
}

# aws_default_route_table 는 vpc 를 생성하면 생기는 기본 route table 을 terraform 이 관리할 수 있게 해줍니다.
# aws_route 로 설정을 적용할 수 있습니다.
resource "aws_default_route_table" "vpc_template" {
  default_route_table_id = aws_vpc.vpc_template.default_route_table_id

  tags = {
    creator = var.tags.creator
    env = var.tags.env
  }
}

# aws_default_route_table 과 동일하게 vpc 가 만들어지면 기본으로 생성되는 sg 이고 terraform 이 관리하도록 지정합니다.
# 기본적으로 모든 ingress 는 unable, 모든 egress 는 enable 입니다.
resource "aws_default_security_group" "vpc_template" {
  vpc_id = aws_vpc.vpc_template.id
  ingress {
    from_port = var.vpc_default_sg_ingress.from_port
    to_port = var.vpc_default_sg_ingress.to_port
    protocol = var.vpc_default_sg_ingress.protocol
    self = var.vpc_default_sg_ingress.self
  }
  egress {
    from_port = var.vpc_default_sg_egress.from_port
    to_port = var.vpc_default_sg_egress.to_port
    protocol = var.vpc_default_sg_egress.protocol
    cidr_blocks = var.vpc_default_sg_egress.cidr_blocks
  }

  tags = {
    creator = var.tags.creator
    env = var.tags.env
  }
}

# 위와 같습니다.
resource "aws_default_network_acl" "vpc_template" {
  default_network_acl_id = aws_vpc.vpc_template.default_network_acl_id
  ingress {
    protocol = var.vpc_default_nacl_ingress.protocol
    rule_no = var.vpc_default_nacl_ingress.rule_no
    action = var.vpc_default_nacl_ingress.action
    cidr_block = var.vpc_default_nacl_ingress.cidr_block
    from_port = var.vpc_default_nacl_ingress.from_port
    to_port = var.vpc_default_nacl_ingress.to_port
  }
  egress {
    protocol = var.vpc_default_nacl_egress.protocol
    rule_no = var.vpc_default_nacl_egress.rule_no
    action = var.vpc_default_nacl_egress.action
    cidr_block = var.vpc_default_nacl_egress.cidr_block
    from_port = var.vpc_default_nacl_egress.from_port
    to_port = var.vpc_default_nacl_egress.to_port
  }

  tags = {
    creator = var.tags.creator
    env = var.tags.env
  }
}