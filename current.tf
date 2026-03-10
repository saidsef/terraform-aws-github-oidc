data "aws_partition" "current" {}

locals {
  repositories_branches = length(var.github_repositories) > 0 ? flatten([
    for repo in var.github_repositories : [
      for branch in repo.branches : {
        branch = branch
        name   = repo.name
      }
    ]
  ]) : []
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    dynamic "condition" {
      for_each = length(local.repositories_branches) > 0 ? [1] : []
      content {
        test     = "ForAnyValue:StringLike"
        values   = [for repo in local.repositories_branches : format("repo:%s/%s:%s", var.github_organisation, repo.name, repo.branch)]
        variable = format("%s:sub", var.url)
      }
    }

    principals {
      identifiers = [local.oidc_provider.arn]
      type        = "Federated"
    }
  }

}

data "aws_iam_openid_connect_provider" "provider" {
  count = tobool(var.enabled) && !tobool(var.create_oidc_provider) ? 1 : 0

  url = format("https://%s", var.url)
}

data "tls_certificate" "provider" {
  url = format("https://%s/.well-known/openid-configuration", var.url)
}
