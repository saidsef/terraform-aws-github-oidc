terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4, < 7"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4, < 5"
    }
  }

  required_version = "~> 1"
}
