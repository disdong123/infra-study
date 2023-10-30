module "vpc" {
  source = "../../module/global/network"

  vpc_cidr_block      = var.vpc_cidr_block
  vpc_default_nacl_egress = var.vpc_default_nacl_egress
  vpc_default_nacl_ingress = var.vpc_default_nacl_ingress
  vpc_default_sg_egress = var.vpc_default_sg_egress
  vpc_default_sg_ingress = var.vpc_default_sg_ingress
  vpc_public_subnet_list = var.vpc_public_subnet_list
  nat_enabled = var.nat_enabled
  vpc_private_subnet_list = var.vpc_private_subnet_list
}