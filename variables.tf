
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
  type        = list(any)
  default     = []
  description = "Array of access levels and user(s)/group(s) allowed to merge to protected branch"
}

variable "allowed_to_push" {
  type        = list(any)
  default     = []
  description = "Array of access levels and user(s)/group(s) allowed to push to protected branch"
}

variable "allowed_to_unprotect" {
  type        = list(any)
  default     = []
  description = "Array of access levels and user(s)/group(s) allowed to unprotect push to protected branch"
}

variable "code_owner_approval_required" {
  type        = bool
  default     = null
  description = "Can be set to true to require code owner approval before merging"
}

variable "merge_access_level" {
  type        = string
  default     = "maintainer"
  description = "Access levels allowed to merge"

  validation {
    condition     = contains(["no one", "developer", "maintainer", "admin"], var.merge_access_level)
    error_message = "Valid values are no one, developer, maintainer, admin"
  }
}

variable "push_access_level" {
  type        = string
  default     = "maintainer"
  description = "Access levels allowed to push"

  validation {
    condition     = contains(["no one", "developer", "maintainer", "admin"], var.push_access_level)
    error_message = "Valid values are no one, developer, maintainer, admin"
  }
}

variable "unprotect_access_level" {
  type        = string
  default     = "maintainer"
  description = "Access levels allowed to unprotect"

  validation {
    condition     = contains(["no one", "developer", "maintainer", "admin"], var.unprotect_access_level)
    error_message = "Valid values are no one, developer, maintainer, admin"
  }
}
