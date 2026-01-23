module "gitlab_branch_protection" {
  source = "../../"

  branch  = "main"
  project = data.gitlab_project.this.id

  push_access_level = "no one"
}
