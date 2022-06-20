variable "name" {
  description = "The name of the repository"
  type        = string
}
variable "homepage_url" {
  description = "The homepage url of the repository"
  type        = string
}
variable "description" {
  description = "The description of the repository"
  type        = string
}
variable "visibility" {
  description = "The visibility of the repository"
  type        = string
  default     = "public"
  validation {
    condition     = var.visibility == "public" || var.visibility == "private"
    error_message = "Visibility must be either public or private."
  }
}

variable "template" {
  description = "The template of the repository"
  type = object({
    owner      = string
    repository = string
  })
}
variable "functions" {
  description = "Enabled functions"
  type = object({
    issues    = bool
    wiki      = bool
    projects  = bool
    template  = bool
    downloads = bool
    topics    = bool
    archive   = bool
  })
  default = {
    issues    = true
    wiki      = true
    projects  = true
    template  = false
    downloads = true
    topics    = true
    archive   = false
  }
}

variable "merge_settings" {
  type = object({
    allow_merge_commit     = bool
    allow_rebase_merge     = bool
    allow_squash_merge     = bool
    allow_auto_merge       = bool
    delete_branch_on_merge = bool
  })
  description = "Merge settings"
  default = {
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = true
    delete_branch_on_merge = false
  }
}

variable "branches" {
  type        = set(string)
  description = "Default branches to add to the repo"
  default     = ["master", "dev"]
}
variable "default_branch" {
  description = "The default branch of the repository"
  type        = string
  default     = "master"
}

variable "branch_protection" {
  type = map(object({
    enforce_admins          = bool
    conversation_resolution = bool
    signed_commits          = bool
    pull_request_reviews = object({
      dismiss_stale_reviews  = bool
      code_owner_reviews     = bool
      approving_review_count = number
    })
    status_checks = object({
      strict   = bool
      contexts = set(string)
    })
    restrictions = object({
      users = set(string)
      teams = set(string)
    })
  }))
  description = "Branch protection settings"
}
variable "app_installations" {
  type        = set(string)
  description = "App installations to add to the repo"
}
variable "create_default_labels" {
  type        = bool
  description = "Create default labels"
}
variable "labels" {
  type = map(object({
    description = string
    color       = string
  }))
  description = "Labels to add to the repo"
}
