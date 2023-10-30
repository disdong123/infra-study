terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.4.0"
    }
  }

  required_version = ">= 1.3"
}

provider "aws" {
  shared_credentials_files = ["$HOME/.aws/credentials"]
  region     = var.region
}

variable "domain" {
  default = "bbpstudio.kr"
}

variable "region" {
  default = "ap-northeast-2"
}

variable "iam_user_name" {
  default = "bbpstudio"
}

variable "iam_policy_arn_list" {
  default = [
    "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess",
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess",
  ]
}

variable "vpc_cidr_block" {
  default = "10.10.0.0/16"
}

variable "vpc_default_sg_ingress" {
  default = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }
}

variable "vpc_default_sg_egress" {
  default = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "vpc_default_nacl_ingress" {
  default = {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

variable "vpc_default_nacl_egress" {
  default = {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

variable "vpc_public_subnet_list" {
  default = [
    {
      cidr_block = "10.10.1.0/24"
      map_public_ip_on_launch = true
      availability_zone = "ap-northeast-2a"
    },
    {
      cidr_block = "10.10.2.0/24"
      map_public_ip_on_launch = true
      availability_zone = "ap-northeast-2c"
    },
  ]
}

variable "nat_enabled" {
  default = true
}

variable "vpc_private_subnet_list" {
  default = [
    {
      cidr_block        = "10.10.3.0/24"
      availability_zone = "ap-northeast-2a"
    },
    {
      cidr_block        = "10.10.4.0/24"
      availability_zone = "ap-northeast-2c"
    },
  ]
}