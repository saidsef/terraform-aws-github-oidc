output "role_id" {
  description = "AWS role ID"
  value       = aws_iam_role.role[0].id
  sensitive   = false
}

output "role_arn" {
  description = "AWS role ARN"
  value       = aws_iam_role.role[0].arn
  sensitive   = false
}

output "repositories" {
  description = "List if GitHub repositories and branches"
  value       = local.repositories_branches
  sensitive   = false
}
