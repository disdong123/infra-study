## terraform import module.app.aws_route53_zone.bbpstudio Z0843266A90HDU9R3K42
## terraform import module.app.aws_route53_record.A Z0843266A90HDU9R3K42_bbpstudio.kr_A
# terraform import module.app.aws_iam_user.admin admin
module "app" {
  source = "../app/global"

  route53_domain = var.domain
  region = var.region
  name = var.name
  env = var.env
  cidr_block = var.cidr_block
}
