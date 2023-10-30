resource "aws_iam_user" "iam_user_template" {
  name = var.iam_user_name
  tags = {
    name = var.tag_creator
    env = var.tag_env
  }
}

resource "aws_iam_user_policy_attachment" "iam_user_template_api_gateway_administrator" {
  user       = aws_iam_user.iam_user_template.name
  count = length(var.iam_policy_arn_list)
  policy_arn = var.iam_policy_arn_list[count.index]
}