output "branch_protection_id" {
  description = "The ID of the branch protection"
  value       = module.gitlab_branch_protection.branch_protection_id
}

output "id" {
  description = "The ID of this Terraform resource"
  value       = module.gitlab_branch_protection.id
}
