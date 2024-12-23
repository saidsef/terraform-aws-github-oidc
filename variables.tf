variable "attach_admin_policy" {
  default     = false
  description = "Attach AdministratorAccess policy"
  type        = bool
}

variable "attach_read_only_policy" {
  default     = true
  description = "Attach ReadOnly policy"
  type        = bool
}

variable "create_oidc_provider" {
  default     = true
  description = "Create GitHub OIDC provider"
  type        = bool
}

variable "enabled" {
  default     = true
  description = "Enable resource creation"
  type        = bool
}

variable "force_detach_policies" {
  default     = false
  description = "Force detach IAM policies"
  type        = string
}

variable "github_organisation" {
  description = "GitHub organisation name"
  type        = string
}

variable "github_repositories" {
  type = list(object({
    name     = string
    branches = list(string)
  }))
  default = [{
    branches = null
    name     = null
  }]
  description = "GitHub repository names and branches"
}

variable "iam_role_name" {
  default     = "github-actions"
  description = "IAM role name"
  type        = string
}

variable "iam_role_path" {
  default     = "/"
  description = "IAM role path"
  type        = string
  sensitive   = false
}

variable "iam_role_permissions_boundary" {
  default     = ""
  description = "IAM role permissions boundary ARN"
  type        = string
  sensitive   = false
}

variable "iam_role_policy_arns" {
  default     = []
  description = "IAM policy ARNs to attach"
  type        = list(string)
  sensitive   = false
}

variable "max_session_duration" {
  default     = 3600
  description = "Session duration in seconds"
  type        = number
  sensitive   = false

  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "Must be between 3600 and 43200 seconds."
  }
}

variable "url" {
  type        = string
  description = "Identity provider URL"
  default     = "token.actions.githubusercontent.com"
  sensitive   = false
}

variable "tags" {
  default     = {}
  description = "Tags to apply to resources"
  type        = map(string)
  sensitive   = false
}
