resource "aws_iam_user" "admin_user" {
  name = "admin_user"
}

resource "aws_iam_user_policy_attachment" "admin_access" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"  # SEC-TF-IAM-001
}