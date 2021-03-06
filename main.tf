resource "github_repository" "this" {
  name                   = var.name
  description            = var.description
  visibility             = var.visibility
  homepage_url           = var.homepage_url
  has_issues             = var.functions.issues
  has_projects           = var.functions.projects
  has_wiki               = var.functions.wiki
  allow_merge_commit     = var.merge_settings.allow_auto_merge
  allow_rebase_merge     = var.merge_settings.allow_rebase_merge
  allow_squash_merge     = var.merge_settings.allow_squash_merge
  allow_auto_merge       = var.merge_settings.allow_auto_merge
  delete_branch_on_merge = var.merge_settings.delete_branch_on_merge
  is_template            = var.functions.template
  has_downloads          = var.functions.downloads
  auto_init              = var.template == null
  archived               = var.functions.archive
  archive_on_destroy     = var.functions.archive
  vulnerability_alerts   = var.visibility == "public"
  dynamic "template" {
    for_each = var.template != null ? range(1) : range(0)
    content {
      owner      = var.template.owner
      repository = var.template.repository
    }
  }
}
resource "github_branch" "this" {
  for_each      = toset(var.template != null ? [for k, v in var.branches : k if k != var.default_branch] : var.branches)
  branch        = each.key
  repository    = github_repository.this.name
  source_branch = var.default_branch
}
resource "github_branch_default" "this" {
  branch     = var.template != null ? var.default_branch : github_branch.this[var.default_branch].branch
  repository = github_repository.this.name
}
resource "github_branch_protection_v3" "this" {
  for_each                        = var.branch_protection
  repository                      = github_repository.this.name
  branch                          = each.key
  enforce_admins                  = each.value.enforce_admins
  require_conversation_resolution = each.value.conversation_resolution
  require_signed_commits          = each.value.signed_commits
  dynamic "required_status_checks" {
    for_each = each.value.status_checks != null ? range(1) : range(0)
    content {
      strict   = each.value.status_checks.strict
      contexts = each.value.status_checks.contexts
    }
  }
  dynamic "required_pull_request_reviews" {
    for_each = each.value.pull_request_reviews != null ? range(1) : range(0)
    content {
      dismiss_stale_reviews = each.value.pull_request_reviews.dismiss_stale_reviews
      #      dismissal_users                 = each.value.pull_request_reviews.dismissal_users
      #      dismissal_teams                 = [for t in required_pull_request_reviews.value.dismissal_teams : replace(lower(t), "/[^a-z0-9_]/", "-")]
      require_code_owner_reviews      = each.value.pull_request_reviews.code_owner_reviews
      required_approving_review_count = each.value.pull_request_reviews.approving_review_count
    }
  }

  depends_on = [github_branch.this]
}
resource "github_app_installation_repository" "this" {
  for_each        = var.app_installations
  repository      = github_repository.this.name
  installation_id = each.key
}
locals {
  labels = {
    automerge = {
      description = "Automatically merge pull requests"
      color       = "0e8a16"
    }
    dependencies = {
      description = "Labels for managed dependencies i.e. DependaBot"
      color       = "f1c40f"
    }
    bug = {
      description = "Something isn't working"
      color       = "d73a4a"
    },
    documentation = {
      description = "Improvements or additions to documentation"
      color       = "0075ca"
    },
    duplicate = {
      description = "This issue or pull request already exists"
      color       = "cfd3d7"
    },
    enhancement = {
      description = "New feature or request"
      color       = "a2eeef"
    },
    "good first issue" = {
      description = "Good for newcomers"
      color       = "7057ff"
    },
    "help wanted" = {
      description = "Extra attention is needed"
      color       = "008672"
    },
    invalid = {
      description = "This doesn't seem right"
      color       = "e4e669"
    },
    question = {
      description = "Further information is requested"
      color       = "d876e3"
    },
    wontfix = {
      description = "This will not be worked on"
      color       = "ffffff"
    }
    examples = {
      description = "Label for examples how to use module"
      color       = "b60205"
    }
    "github-actions" = {
      description = "Label for GitHub Actions"
      color       = "BBBCA3"
    }
    "needs-triage" = {
      description = "Newly added issues, prs, etc. which needs to be reviewed"
      color       = "128DE6"
    }
    "size/L" = {
      description = "Managed by automation to categorize the size of a PR."
      color       = "453D32"
    },
    "size/M" = {
      description = "Managed by automation to categorize the size of a PR."
      color       = "453D32"
    },
    "size/S" = {
      description = "Managed by automation to categorize the size of a PR."
      color       = "453D32"
    },
    "size/XS" = {
      description = "Managed by automation to categorize the size of a PR."
      color       = "453D32"
    },
    "size/XL" = {
      description = "Managed by automation to categorize the size of a PR."
      color       = "453D32"
    },
    "size/XXL" = {
      description = "Managed by automation to categorize the size of a PR."
      color       = "453D32"
    },
    stale = {
      description = "This issue or pull request is stale"
      color       = "cfd3d7"
    },
    "waiting-response" = {
      description = "Waiting for a response from a reviewer"
      color       = "0075ca"
    }
  }
}
resource "github_issue_label" "this" {
  for_each    = var.create_default_labels ? merge(local.labels, var.labels) : var.labels
  repository  = github_repository.this.name
  name        = each.key
  description = each.value.description
  color       = each.value.color
}
