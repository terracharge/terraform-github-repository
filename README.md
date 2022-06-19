<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.2.3 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 4.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.26.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_app_installation_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/app_installation_repository) | resource |
| [github_branch.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection_v3.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_issue_label.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_installations"></a> [app\_installations](#input\_app\_installations) | App installations to add to the repo | `set(string)` | n/a | yes |
| <a name="input_branch_protection"></a> [branch\_protection](#input\_branch\_protection) | Branch protection settings | <pre>map(object({<br>    enforce_admins          = bool<br>    conversation_resolution = bool<br>    signed_commits          = bool<br>    pull_request_reviews = object({<br>      dismiss_stale_reviews           = bool<br>      code_owner_reviews              = bool<br>      required_approving_review_count = number<br>    })<br>    status_checks = object({<br>      strict   = bool<br>      contexts = set(string)<br>    })<br>    restrictions = object({<br>      users = set(string)<br>      teams = set(string)<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_branches"></a> [branches](#input\_branches) | Default branches to add to the repo | `set(string)` | <pre>[<br>  "master",<br>  "dev"<br>]</pre> | no |
| <a name="input_default_branch"></a> [default\_branch](#input\_default\_branch) | The default branch of the repository | `string` | `"master"` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the repository | `string` | n/a | yes |
| <a name="input_functions"></a> [functions](#input\_functions) | Enabled functions | <pre>object({<br>    issues    = bool<br>    wiki      = bool<br>    projects  = bool<br>    template  = bool<br>    downloads = bool<br>    topics    = bool<br>    archive   = bool<br>  })</pre> | <pre>{<br>  "archive": false,<br>  "downloads": true,<br>  "issues": true,<br>  "projects": true,<br>  "template": false,<br>  "topics": true,<br>  "wiki": true<br>}</pre> | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | The homepage url of the repository | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to add to the repo | <pre>map(object({<br>    description = string<br>    color       = string<br>  }))</pre> | n/a | yes |
| <a name="input_merge_settings"></a> [merge\_settings](#input\_merge\_settings) | Merge settings | <pre>object({<br>    allow_merge_commit     = bool<br>    allow_rebase_merge     = bool<br>    allow_squash_merge     = bool<br>    allow_auto_merge       = bool<br>    delete_branch_on_merge = bool<br>  })</pre> | <pre>{<br>  "allow_auto_merge": true,<br>  "allow_merge_commit": true,<br>  "allow_rebase_merge": true,<br>  "allow_squash_merge": true,<br>  "delete_branch_on_merge": false<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_template"></a> [template](#input\_template) | The template of the repository | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | n/a | yes |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The visibility of the repository | `string` | `"public"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_installations"></a> [app\_installations](#output\_app\_installations) | A map of deploy app installations keyed by installation id. |
| <a name="output_branches"></a> [branches](#output\_branches) | A map of branch objects keyed by branch name. |
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | A string of the form 'orgname/reponame'. |
| <a name="output_git_clone_url"></a> [git\_clone\_url](#output\_git\_clone\_url) | URL that can be provided to git clone to clone the repository anonymously via the git protocol. |
| <a name="output_html_url"></a> [html\_url](#output\_html\_url) | URL to the repository on the web. |
| <a name="output_http_clone_url"></a> [http\_clone\_url](#output\_http\_clone\_url) | URL that can be provided to git clone to clone the repository via HTTPS. |
| <a name="output_issue_labels"></a> [issue\_labels](#output\_issue\_labels) | A map of issue labels keyed by label input id or name. |
| <a name="output_ssh_clone_url"></a> [ssh\_clone\_url](#output\_ssh\_clone\_url) | URL that can be provided to git clone to clone the repository via SSH. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-disable -->
<!-- prettier-ignore-end -->
