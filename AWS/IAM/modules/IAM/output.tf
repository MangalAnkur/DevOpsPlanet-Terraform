output "username" {
  value = aws_iam_user_login_profile.credentials.id
}

output "user_arn" {
  value = aws_iam_user.iam_user.arn
}

output "password" {
  value     = aws_iam_user_login_profile.credentials.password
  sensitive = true
}

output "secret" {
  value     = aws_iam_access_key.credentials.secret
  sensitive = true
}

output "access_key" {
  value = aws_iam_access_key.credentials.id
}