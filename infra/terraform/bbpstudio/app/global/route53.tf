## terraform import aws_route53_zone.bbpstudio Z0843266A90HDU9R3K42
#resource "aws_route53_zone" "bbpstudio" {
#  name = var.route53_domain
#}
#
## terraform import aws_route53_record.A Z0843266A90HDU9R3K42_bbpstudio.kr_A
#resource "aws_route53_record" "A" {
#  zone_id    = aws_route53_zone.bbpstudio.zone_id
#  name       = var.route53_domain
#  type       = "A"
#  ttl        = 300
#  records   = [
#    "27.0.236.139"
#  ]
#}