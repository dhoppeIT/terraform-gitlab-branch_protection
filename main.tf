resource "gitlab_branch_protection" "this" {
  branch  = var.branch
  project = var.project

  allow_force_push             = var.allow_force_push
  code_owner_approval_required = var.code_owner_approval_required
  merge_access_level           = var.merge_access_level
  push_access_level            = var.push_access_level
  unprotect_access_level       = var.unprotect_access_level

  dynamic "allowed_to_merge" {
    for_each = length(var.allowed_to_merge) > 0 ? [var.allowed_to_merge] : []

    content {
      group_id = lookup(allowed_to_merge.value, "group_id", null)
      user_id  = lookup(allowed_to_merge.value, "user_id", null)
    }
  }

  dynamic "allowed_to_push" {
    for_each = length(var.allowed_to_push) > 0 ? [var.allowed_to_push] : []

    content {
      deploy_key_id = lookup(allowed_to_push.value, "deploy_key_id", null)
      group_id      = lookup(allowed_to_push.value, "group_id", null)
      user_id       = lookup(allowed_to_push.value, "user_id", null)
    }
  }

  dynamic "allowed_to_unprotect" {
    for_each = length(var.allowed_to_unprotect) > 0 ? [var.allowed_to_unprotect] : []

    content {
      group_id = lookup(allowed_to_unprotect.value, "group_id", null)
      user_id  = lookup(allowed_to_unprotect.value, "user_id", null)
    }
  }
}
