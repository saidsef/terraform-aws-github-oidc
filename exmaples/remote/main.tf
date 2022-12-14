provider "aws" {
  region = var.region
}

module "github_oidc" {
  source  = "saidsef/github-oidc/aws"
  version = ">= 1"

  attach_admin_policy           = true
  attach_read_only_policy       = true
  create_oidc_provider          = true
  enabled                       = true
  force_detach_policies         = false
  github_organisation           = var.github_organisation
  github_repositories           = [{ name = "terraform-aws-github-oidc", branches = ["main", "pr-*", "*pull*", "*"] }]
  iam_role_name                 = "github-actions"
  iam_role_path                 = "/"
  iam_role_permissions_boundary = ""
  iam_role_policy_arns          = []
  max_session_duration          = 3600
  tags                          = {}
  url                           = "token.actions.githubusercontent.com"
}