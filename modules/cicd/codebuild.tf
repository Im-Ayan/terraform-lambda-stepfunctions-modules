# -------------------------------
# CodeBuild Project: Terraform PLAN
# -------------------------------
resource "aws_codebuild_project" "terraform_plan" {
  name         = "${var.project}-terraform-plan-${var.env}"
  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:7.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec-plan.yml"
  }

  cache {
    type = "NO_CACHE"
  }
}

# -------------------------------
# CodeBuild Project: Terraform APPLY
# -------------------------------
resource "aws_codebuild_project" "terraform_apply" {
  name         = "${var.project}-terraform-apply-${var.env}"
  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:7.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec-apply.yml"
  }

  cache {
    type = "NO_CACHE"
  }
}
