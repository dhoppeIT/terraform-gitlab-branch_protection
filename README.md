# terraform-gitlab_branch_protection

Terraform module to manage the following GitLab resources:

* gitlab_branch_protection

## Usage

Copy and paste the following code snippet to your Terraform configuration,
specify the required variables and run the command `terraform init`.

```hcl
module "gitlab_group" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-group/local"
  version = "1.2.0"

  name = "Example (group)"
  path = "example-group-48165"
}

module "gitlab_project" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-project/local"
  version = "1.2.1"

  name = "example-project"

  description  = "Example (project)"
  namespace_id = module.gitlab_group.id
}

module "gitlab_branch_protection" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-branch-protection/local"
  version = "1.0.0"

  branch  = "main"
  project = module.gitlab_project.id

  push_access_level = "no one"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | ~> 18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | ~> 18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_branch_protection.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/branch_protection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_force_push"></a> [allow\_force\_push](#input\_allow\_force\_push) | Can be set to true to allow users with push access to force push | `bool` | `false` | no |
| <a name="input_allowed_to_merge"></a> [allowed\_to\_merge](#input\_allowed\_to\_merge) | Array of access levels and user(s)/group(s) allowed to merge to protected branch | `map(any)` | `{}` | no |
| <a name="input_allowed_to_push"></a> [allowed\_to\_push](#input\_allowed\_to\_push) | Array of access levels and user(s)/group(s) allowed to push to protected branch | `map(any)` | `{}` | no |
| <a name="input_allowed_to_unprotect"></a> [allowed\_to\_unprotect](#input\_allowed\_to\_unprotect) | Array of access levels and user(s)/group(s) allowed to unprotect push to protected branch | `map(any)` | `{}` | no |
| <a name="input_branch"></a> [branch](#input\_branch) | Name of the branch | `string` | n/a | yes |
| <a name="input_code_owner_approval_required"></a> [code\_owner\_approval\_required](#input\_code\_owner\_approval\_required) | Can be set to true to require code owner approval before merging | `bool` | `null` | no |
| <a name="input_merge_access_level"></a> [merge\_access\_level](#input\_merge\_access\_level) | Access levels allowed to merge | `string` | `"maintainer"` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project | `string` | n/a | yes |
| <a name="input_push_access_level"></a> [push\_access\_level](#input\_push\_access\_level) | Access levels allowed to push | `string` | `"maintainer"` | no |
| <a name="input_unprotect_access_level"></a> [unprotect\_access\_level](#input\_unprotect\_access\_level) | Access levels allowed to unprotect | `string` | `"maintainer"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_branch_protection_id"></a> [branch\_protection\_id](#output\_branch\_protection\_id) | The ID of the branch protection |
| <a name="output_id"></a> [id](#output\_id) | The ID of this Terraform resource |
<!-- END_TF_DOCS -->

## Authors

Created and maintained by [Dennis Hoppe](https://gitlab.com/dhoppeIT).

## License

Apache 2 licensed. See [LICENSE](LICENSE) for full details.
