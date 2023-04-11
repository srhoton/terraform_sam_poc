resource "aws_apigatewayv2_api" "test_api" {
  name = "sam-test-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "test_api_root_integration" {
  api_id = aws_apigatewayv2_api.test_api.id
  description = "Root integration for sam-api-test"
  integration_type = "HTTP_PROXY"
  integration_uri = "https://www.google.com"
  integration_method = "ANY"
}

resource "aws_apigatewayv2_route" "test_api_route" {
  api_id = aws_apigatewayv2_api.test_api.id
  route_key = "ANY /"
  target = "integrations/${aws_apigatewayv2_integration.test_api_root_integration.id}"
  authorization_type = "CUSTOM"
  authorizer_id = aws_apigatewayv2_authorizer.test_api_authorizer.id
}

resource "aws_apigatewayv2_stage" "test_api_default" {
  api_id = aws_apigatewayv2_api.test_api.id
  name = "$default" 
  auto_deploy = true
  description = "test api default deployment"
}

resource "aws_apigatewayv2_authorizer" "test_api_authorizer" {
  api_id = aws_apigatewayv2_api.test_api.id
  authorizer_type = "REQUEST"
  authorizer_uri = module.lambda_authorizer.lambda_function_invoke_arn
  identity_sources = ["$request.header.Authorization"]
  name = "test-api-authorizer"
  authorizer_payload_format_version = "2.0"
}
