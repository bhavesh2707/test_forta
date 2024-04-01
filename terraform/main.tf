provider "aws_cloudformation_stack" {
  region = var.region
}

module "password" {
  source = "./module/password"
}

module "secret" {
  source = "./module/secret"
  secret_name = var.secret_name
  username = var.username
  password = module.password.result
}
