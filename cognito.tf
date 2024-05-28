resource "aws_cognito_user_pool" "user_pool" {
  name = "user_pool"
  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name                                 = "user-pool-client"
  user_pool_id                         = aws_cognito_user_pool.user_pool.id
  generate_secret                      = true
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code", "implicit"]
  allowed_oauth_scopes                 = ["email", "openid"]
    callback_urls = [
    "http://localhost:4200/callback",
    "https://main.d3h3zva4jvi0fz.amplifyapp.com//callback"
  ]
  logout_urls = [
    "http://localhost:4200/logout",
    "https://main.d3h3zva4jvi0fz.amplifyapp.com//logout"
  ]
}

output "pool_client_id" {
  value       = aws_cognito_user_pool_client.user_pool_client.id
  description = "Client ID for the user pool client"
}

output "client_secret" {
  value       = aws_cognito_user_pool_client.user_pool_client.client_secret
  description = "Client secret for the user pool client"
  sensitive   = true
}

output "user_pool_id" {
  value       = aws_cognito_user_pool.user_pool.id
  description = "User pool ID"
}