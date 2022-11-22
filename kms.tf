data "aws_kms_secrets" "git-creds" {
  secret {
    name    = "git-token"
    payload = file("${path.module}/git_token.yaml.encrypted")
  }
}