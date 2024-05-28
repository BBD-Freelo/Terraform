variable "github_token" {}

resource "aws_amplify_app" "amplify_app" {
  name        = "Freelo"
  repository  = "https://github.com/BBD-Freelo/Frontend"
  oauth_token = var.github_token
}
resource "aws_amplify_branch" "amplify_branch" {
  app_id      = aws_amplify_app.amplify_app.id
  branch_name = "main"
}