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
