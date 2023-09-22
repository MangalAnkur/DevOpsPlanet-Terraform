resource "aws_iam_user" "iam_user" {
  name = var.username
}

resource "aws_iam_access_key" "credentials" {
  user = aws_iam_user.iam_user.name
}

resource "aws_iam_user_login_profile" "credentials" {
  user                    = aws_iam_user.iam_user.name
  password_reset_required = true
}

resource "aws_iam_user_policy" "s3_policy" {
  name = var.policy_name
  user = aws_iam_user.iam_user.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          "iam:ChangePassword",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}