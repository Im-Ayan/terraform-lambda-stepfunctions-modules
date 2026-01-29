module "cicd" {
  source = "../../modules/cicd"

  project = "etl"
  env     = "dev"

  github_owner  = "Im-Ayan"
  github_repo   = "terraform-lambda-stepfunctions-modules"
  github_branch = "dev"

  github_token = var.github_token

  artifact_bucket = "terraform-pipeline-artifacts-dev"
}
