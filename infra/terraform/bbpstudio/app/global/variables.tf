variable "route53_domain" {}

variable "region" {}

variable "creator" {}

variable "env" {}

variable "az_list" {
  default = ["ap-northeast-2a", "ap-northeast-2c"]
}