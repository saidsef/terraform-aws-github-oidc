# Terraform AWS GitHub OIDC Provider

This Terraform module enables you to configure GitHub Actions as an AWS IAM OIDC identity provider in AWS, which enables GitHub Actions to access resources within an AWS account(s) without requiring long-lived credentials to be stored as GitHub secrets.

## Prerequisites

- AWS Account(s) and credentials
- GitHub repository
- Terraform >= 1.1.x
- Profit?

## Deployment / Usage

```terraform
provider "aws" {
  region = var.region
}

module "github_oidc" {
  source  = "saidsef/terraform-aws-github-oidc/aws"
  version = "main"

  attach_read_only_policy = true
  github_organisation     = "saidsef"
  github_repositories     = [{ name = "platform", branches = ["*main", "pr-*", "*pull*", "*"] }]
  tags                    = var.tags
}
```

## Provider Specifications and Requirements

Please see [TERRAFORM.md](./TERRAFORM.md)

## Source

Our latest and greatest source of `terraform-aws-github-oidc` can be found on [GitHub](#deployment). Fork us!

## Contributing

We would :heart: you to contribute by making a [pull request](https://github.com/saidsef/terraform-aws-github-oidc/pulls).

Please read the official [Contribution Guide](./CONTRIBUTING.md) for more information on how you can contribute.