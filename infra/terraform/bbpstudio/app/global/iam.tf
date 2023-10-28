resource "aws_iam_user" "admin" {
  name = "admin"

  tags = {
    name = var.name
    env = var.env
  }
}

resource "aws_iam_user_policy_attachment" "admin_policy" {
  user       = aws_iam_user.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
