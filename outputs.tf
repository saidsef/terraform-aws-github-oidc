output "role_id" {
  description = "AWS role ID"
  value       = try(aws_iam_role.role[0].id, null)
  sensitive   = false
}

output "role_arn" {
  description = "AWS role ARN"
  value       = try(aws_iam_role.role[0].arn, null)
  sensitive   = false
}

output "role_name" {
  description = "AWS role name"
  value       = try(aws_iam_role.role[0].name, null)
  sensitive   = false
}

output "repositories" {
  description = "List if GitHub repositories and branches"
  value       = local.repositories_branches
  sensitive   = false
}
