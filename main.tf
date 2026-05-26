resource "gitlab_branch_protection" "this" {
  branch  = var.branch
  project = var.project

  allow_force_push             = var.allow_force_push
  code_owner_approval_required = var.code_owner_approval_required
  merge_access_level           = var.merge_access_level
  push_access_level            = var.push_access_level

  allowed_to_merge     = var.allowed_to_merge
  allowed_to_push      = var.allowed_to_push
  allowed_to_unprotect = var.allowed_to_unprotect
}
