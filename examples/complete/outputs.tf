output "role_arn" {
  description = "AWS action role ARN"
  sensitive   = false
  value       = module.github_oidc.role_arn
}
