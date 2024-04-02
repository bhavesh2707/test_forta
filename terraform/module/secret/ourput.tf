output "secret_info" {
  value = {
    secret_name = aws_secretsmanager_secret.forta_secret.name
    secret_version_arn = aws_secretsmanager_secret_version.forta_secret_version.arn
  }
}