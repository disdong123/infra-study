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

variable "name" {
  default = "cola"
}

variable "env" {
  default = "dev"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}