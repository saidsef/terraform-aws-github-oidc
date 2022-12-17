# Terraform AWS GitHub OIDC Provider
[![CI](https://github.com/saidsef/terraform-aws-github-oidc/actions/workflows/ci.yaml/badge.svg)](#deployment--usage) ![GitHub issues](https://img.shields.io/github/issues-raw/saidsef/terraform-aws-gitlab-oidc) [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](./LICENSE.md)

This Terraform module enables you to configure GitHub Actions as an AWS IAM OIDC identity provider in AWS, which enables GitHub Actions to access resources within an AWS account(s) without requiring long-lived credentials to be stored as GitHub secrets.

## Prerequisites

- AWS Account(s) and credentials
- GitHub repository
- Terraform >= 1.x
- Profit?

## Deployment / Usage

```terraform
provider "aws" {
  region = var.region
}

module "github_oidc" {
  source  = "saidsef/github-oidc/aws"
  version = "~> 1"

  attach_read_only_policy = true
  github_organisation     = "saidsef"
  github_repositories     = [{ name = "terraform-aws-github-oidc", branches = ["main", "pr-*", "*pull*", "*"] }]
  tags                    = var.tags
}
```

## Provider Specifications and Requirements

Please see [TERRAFORM.md](./TERRAFORM.md)

## GitHub Actions

Retrieve temporary credentials:

https://github.com/saidsef/terraform-aws-github-oidc/blob/8e9ff77e824ad117cb42ee98f3ed755d28798f66/.github/workflows/ci.yaml#L47-L54

## Source

Our latest and greatest source of `terraform-aws-github-oidc` can be found on [GitHub](https://github.com/saidsef/terraform-aws-github-oidc/fork). Fork us!

## Contributing

We would :heart: you to contribute by making a [pull request](https://github.com/saidsef/terraform-aws-github-oidc/pulls).

Please read the official [Contribution Guide](./CONTRIBUTING.md) for more information on how you can contribute.
