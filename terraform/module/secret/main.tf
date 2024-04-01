resource "aws_secretsmanager_secret" "forta_secret" {
  name = var.secret_name // Specify the name of your secret
}

resource "aws_secretsmanager_secret_version" "forta_secret_version" {
  secret_id     = aws_secretsmanager_secret.example_secret.id
  secret_string = jsonencode({
    "username" = var.username,
    "password" = var.password
  })
}