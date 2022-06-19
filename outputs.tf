output "full_name" {
  value       = github_repository.this.full_name
  description = "A string of the form 'orgname/reponame'."
}
output "html_url" {
  value       = github_repository.this.html_url
  description = "URL to the repository on the web."
}
output "ssh_clone_url" {
  value       = github_repository.this.ssh_clone_url
  description = "URL that can be provided to git clone to clone the repository via SSH."
}
output "http_clone_url" {
  value       = github_repository.this.http_clone_url
  description = "URL that can be provided to git clone to clone the repository via HTTPS."
}
output "git_clone_url" {
  value       = github_repository.this.git_clone_url
  description = "URL that can be provided to git clone to clone the repository anonymously via the git protocol."
}
output "branches" {
  value       = github_branch.this
  description = "A map of branch objects keyed by branch name."
}
output "issue_labels" {
  value       = github_issue_label.this
  description = "A map of issue labels keyed by label input id or name."
}
#output "webhooks" {
#  value       = github_repository_webhook.repository_webhook
#  sensitive   = true
#  description = "All attributes and arguments as returned by the github_repository_webhook resource."
#}
#
#output "secrets" {
#  value       = [for secret in github_actions_secret.repository_secret : secret.secret_name]
#  description = "List of secrets available."
#}
output "app_installations" {
  value       = github_app_installation_repository.this
  description = "A map of deploy app installations keyed by installation id."
}
