output "role_id" {
  value     = aws_iam_role.role[0].id
  sensitive = false
}

output "role_arn" {
  value     = aws_iam_role.role[0].arn
  sensitive = false
}

output "repository" {
  value     = local.repositories_branches
  sensitive = false
}
