variable "branch" {
  type        = string
  description = "Name of the branch"
}

variable "project" {
  type        = string
  description = "The ID of the project"
}

variable "allow_force_push" {
  type        = bool
  default     = false
  description = "Can be set to true to allow users with push access to force push"
}

variable "allowed_to_merge" {
  type = list(object({
    access_level = optional(string)
    group_id     = optional(number)
    user_id      = optional(number)
  }))
  default     = []
  description = "Array of access levels and user(s)/group(s) allowed to merge to protected branch. Only available for Premium and Ultimate instances."

  validation {
    condition = alltrue([
      for entry in var.allowed_to_merge :
      entry.access_level == null || contains(["no one", "developer", "maintainer", "admin"], entry.access_level)
    ])
    error_message = "Valid values for access_level are: no one, developer, maintainer, admin."
  }
}

variable "allowed_to_push" {
  type = list(object({
    access_level  = optional(string)
    deploy_key_id = optional(number)
    group_id      = optional(number)
    user_id       = optional(number)
  }))
  default     = []
  description = "Array of access levels and user(s)/group(s)/deploy keys allowed to push to protected branch. Only available for Premium and Ultimate instances."

  validation {
    condition = alltrue([
      for entry in var.allowed_to_push :
      entry.access_level == null || contains(["no one", "developer", "maintainer", "admin"], entry.access_level)
    ])
    error_message = "Valid values for access_level are: no one, developer, maintainer, admin."
  }
}

variable "allowed_to_unprotect" {
  type = list(object({
    access_level = optional(string)
    group_id     = optional(number)
    user_id      = optional(number)
  }))
  default     = []
  description = "Array of access levels and user(s)/group(s) allowed to unprotect the protected branch. Only available for Premium and Ultimate instances."

  validation {
    condition = alltrue([
      for entry in var.allowed_to_unprotect :
      entry.access_level == null || contains(["developer", "maintainer", "admin"], entry.access_level)
    ])
    error_message = "Valid values for access_level are: developer, maintainer, admin."
  }
}

variable "code_owner_approval_required" {
  type        = bool
  default     = null
  description = "Can be set to true to require code owner approval before merging. Only available for Premium and Ultimate instances."
}

variable "merge_access_level" {
  type        = string
  default     = "maintainer"
  description = "Access levels allowed to merge. Only available for CE instances."

  validation {
    condition     = contains(["no one", "developer", "maintainer", "admin"], var.merge_access_level)
    error_message = "Valid values are: no one, developer, maintainer, admin."
  }
}

variable "push_access_level" {
  type        = string
  default     = "maintainer"
  description = "Access levels allowed to push. Only available for CE instances."

  validation {
    condition     = contains(["no one", "developer", "maintainer", "admin"], var.push_access_level)
    error_message = "Valid values are: no one, developer, maintainer, admin."
  }
}
