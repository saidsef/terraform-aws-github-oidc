# Terraform AWS GitHub OIDC Provider
[![CI](https://github.com/saidsef/terraform-aws-github-oidc/actions/workflows/ci.yaml/badge.svg)](#deployment--usage) ![GitHub issues](https://img.shields.io/github/issues-raw/saidsef/terraform-aws-gitlab-oidc) [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](./LICENSE.md)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fsaidsef%2Fterraform-aws-github-oidc.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fsaidsef%2Fterraform-aws-github-oidc?ref=badge_shield)

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
  version = "~> 2"

  attach_read_only_policy = true
  github_organisation     = "saidsef"
  github_repositories     = [{
    name = "terraform-aws-github-oidc",
    branches = ["main", "pr-*", "*pull*", "*"]
  }]
  tags                    = var.tags
}
```

## Provider Specifications and Requirements

Please see [TERRAFORM.md](./TERRAFORM.md)

## GitHub Actions

Retrieve temporary credentials:

https://github.com/saidsef/terraform-aws-github-oidc/blob/89b5f024f4a339469f233b5d16ca828e222c2f61/.github/workflows/ci.yaml#L80-L96

## Source

Our latest and greatest source of `terraform-aws-github-oidc` can be found on [GitHub](https://github.com/saidsef/terraform-aws-github-oidc/fork). Fork us!

## Contributing

We would :heart: you to contribute by making a [pull request](https://github.com/saidsef/terraform-aws-github-oidc/pulls).

Please read the official [Contribution Guide](./CONTRIBUTING.md) for more information on how you can contribute.


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fsaidsef%2Fterraform-aws-github-oidc.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fsaidsef%2Fterraform-aws-github-oidc?ref=badge_large)