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
  auto_init              = true
  #  gitignore_template     = local.gitignore_template
  #  license_template       = local.license_template
  archived = var.functions.archive
  #  topics                 = local.topics
  archive_on_destroy   = var.functions.archive
  vulnerability_alerts = var.visibility == "public"
  dynamic "template" {
    for_each = var.template != null ? toset(1) : {}
    content {
      owner      = var.template.owner
      repository = var.template.repository
    }
  }
}
