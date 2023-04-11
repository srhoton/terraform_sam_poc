module "lambda_authorizer" {
  source = "terraform-aws-modules/lambda/aws"
  version = "4.13.0"
  create_role = false
  timeout = 30
  source_path = "../src"
  function_name = "jwt-authorizer"
  handler = "index.handler"
  runtime = "nodejs18.x"
  lambda_role   = aws_iam_role.iam_for_lambda.arn
  environment_variables = {
    TOKEN_ISSUER = var.token_issuer
    JWKS_URI = var.jwks_uri
    AUDIENCE = var.audience
  }
}
