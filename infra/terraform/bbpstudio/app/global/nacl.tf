#resource "aws_default_network_acl" "vpc_example_default_nacl" {
#  default_network_acl_id = aws_vpc.vpc_example.default_network_acl_id
#  ingress {
#    protocol   = -1
#    rule_no    = 100
#    action     = "allow"
#    cidr_block = "0.0.0.0/0"
#    from_port  = 0
#    to_port    = 0
#  }
#
#  egress {
#    protocol   = -1
#    rule_no    = 100
#    action     = "allow"
#    cidr_block = "0.0.0.0/0"
#    from_port  = 0
#    to_port    = 0
#  }
#
#  tags = {
#    creator = var.creator
#    env = var.env
#  }
#}
#
## public
#resource "aws_network_acl" "vpc_example_public" {
#  vpc_id = aws_vpc.vpc_example.id
#  subnet_ids = [aws_subnet.vpc_example_public_sub1.id, aws_subnet.vpc_example_public_sub2.id]
#  tags = {
#    creator = var.creator
#    env = var.env
#  }
#}
#
#resource "aws_network_acl_rule" "vpc_example_public_ingress80" {
#  network_acl_id = aws_network_acl.vpc_example_public.id
#  rule_action    = "allow"
#  rule_number    = 100
#  egress = false
#  protocol       = "tcp"
#  cidr_block = "0.0.0.0/0"
#  from_port      = 80
#  to_port        = 80
#}
#
#resource "aws_network_acl_rule" "vpc_example_public_egress80" {
#  network_acl_id = aws_network_acl.vpc_example_public.id
#  rule_action    = "allow"
#  rule_number    = 100
#  egress = true
#  protocol       = "tcp"
#  cidr_block = "0.0.0.0/0"
#  from_port      = 80
#  to_port        = 80
#}
#
#resource "aws_network_acl_rule" "vpc_example_public_ingress443" {
#  network_acl_id = aws_network_acl.vpc_example_public.id
#  rule_action    = "allow"
#  rule_number    = 110
#  egress = false
#  protocol       = "tcp"
#  cidr_block = "0.0.0.0/0"
#  from_port      = 443
#  to_port        = 443
#}
#
#resource "aws_network_acl_rule" "vpc_example_public_egress443" {
#  network_acl_id = aws_network_acl.vpc_example_public.id
#  rule_action    = "allow"
#  rule_number    = 100
#  egress = true
#  protocol       = "tcp"
#  cidr_block = "0.0.0.0/0"
#  from_port      = 443
#  to_port        = 443
#}
#
#resource "aws_network_acl_rule" "vpc_example_public_ingress22" {
#  network_acl_id = aws_network_acl.vpc_example_public.id
#  rule_action    = "allow"
#  rule_number    = 120
#  egress = false
#  protocol       = "tcp"
#  cidr_block = "0.0.0.0/0"
#  from_port      = 22
#  to_port        = 22
#}
#
#resource "aws_network_acl_rule" "vpc_example_public_egress22" {
#  network_acl_id = aws_network_acl.vpc_example_public.id
#  rule_action    = "allow"
#  rule_number    = 100
#  egress = true
#  protocol       = "tcp"
#  cidr_block = "0.0.0.0/0"
#  from_port      = 22
#  to_port        = 22
#}
#
#resource "aws_network_acl_rule" "vpc_example_public_ingress_ephemeral" {
#  network_acl_id = aws_network_acl.vpc_example_public.id
#  rule_action    = "allow"
#  rule_number    = 140
#  egress = false
#  protocol       = "tcp"
#  cidr_block = "0.0.0.0/0"
#  from_port      = 1024
#  to_port        = 65535
#}
#
#resource "aws_network_acl_rule" "vpc_example_public_egress_ephemeral" {
#  network_acl_id = aws_network_acl.vpc_example_public.id
#  rule_action    = "allow"
#  rule_number    = 140
#  egress = true
#  protocol       = "tcp"
#  cidr_block = "0.0.0.0/0"
#  from_port      = 1024
#  to_port        = 65535
#}