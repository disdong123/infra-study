resource "aws_iam_user" "bbpstudio" {
  name = "bbpstudio"
  tags = {
    name = var.creator
    env = var.env
  }
}

resource "aws_iam_user_policy_attachment" "bbpstudio_api_gateway_administrator" {
  user       = aws_iam_user.bbpstudio.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}

resource "aws_iam_user_policy_attachment" "bbpstudio_s3_full_access" {
  user       = aws_iam_user.bbpstudio.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_user_policy_attachment" "bbpstudio_cloud_watch_full_access" {
  user       = aws_iam_user.bbpstudio.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

resource "aws_iam_user_policy_attachment" "bbpstudio_aws_cloud_formation_full_access" {
  user       = aws_iam_user.bbpstudio.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"
}

resource "aws_iam_user_policy_attachment" "bbpstudio_aws_lambda_full_access" {
  user       = aws_iam_user.bbpstudio.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}


# TODO ADMIN
#resource "aws_iam_user" "admin" {
#  name = "admin"
#
#  tags = {
#    name = var.creator
#    env = var.env
#  }
#}
#
#resource "aws_iam_user_policy_attachment" "admin_policy" {
#  user       = aws_iam_user.admin.name
#  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
#}
