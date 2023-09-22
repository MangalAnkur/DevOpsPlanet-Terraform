output "username" {
  value = module.IAM.username
}

output "user_arn" {
  value = module.IAM.user_arn
}

output "secret_key" {
  value     = module.IAM.secret
  sensitive = true
}

output "access_key" {
  value = module.IAM.access_key
}

output "user_password" {
  value     = module.IAM.password
  sensitive = true
}