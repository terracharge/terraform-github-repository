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
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of the repository | `string` | n/a | yes |
| <a name="input_functions"></a> [functions](#input\_functions) | Enabled functions | <pre>object({<br>    issues    = bool<br>    wiki      = bool<br>    projects  = bool<br>    template  = bool<br>    downloads = bool<br>    topics    = bool<br>    archive   = bool<br>  })</pre> | <pre>{<br>  "archive": false,<br>  "downloads": true,<br>  "issues": true,<br>  "projects": true,<br>  "template": false,<br>  "topics": true,<br>  "wiki": true<br>}</pre> | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | The homepage url of the repository | `string` | n/a | yes |
| <a name="input_merge_settings"></a> [merge\_settings](#input\_merge\_settings) | Merge settings | <pre>object({<br>    allow_merge_commit     = bool<br>    allow_rebase_merge     = bool<br>    allow_squash_merge     = bool<br>    allow_auto_merge       = bool<br>    delete_branch_on_merge = bool<br>  })</pre> | <pre>{<br>  "allow_auto_merge": true,<br>  "allow_merge_commit": true,<br>  "allow_rebase_merge": true,<br>  "allow_squash_merge": true,<br>  "delete_branch_on_merge": false<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_template"></a> [template](#input\_template) | The template of the repository | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | n/a | yes |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The visibility of the repository | `string` | `"public"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-disable -->
<!-- prettier-ignore-end -->
