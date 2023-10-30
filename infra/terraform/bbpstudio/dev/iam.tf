module "iam" {
  source = "../../module/global/iam"

  iam_user_name       = var.iam_user_name
  iam_policy_arn_list = var.iam_policy_arn_list
}