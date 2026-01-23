output "branch_protection_id" {
  description = "The ID of the branch protection"
  value       = gitlab_branch_protection.this.branch_protection_id
}

output "id" {
  description = "The ID of this Terraform resource"
  value       = gitlab_branch_protection.this.id
}
