variable "tags" {
    default = {
        creator = "cola"
        env = "dev"
    }
}

variable "vpc_cidr_block" {}
variable "vpc_default_sg_ingress" {}
variable "vpc_default_sg_egress" {}
variable "vpc_default_nacl_ingress" {}
variable "vpc_default_nacl_egress" {}

variable "az_list" {
  default = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "vpc_public_subnet_list" {}
variable "vpc_private_subnet_list" {}
variable "nat_enabled" {
  type = bool
}