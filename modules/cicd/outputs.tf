output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
}

output "codepipeline_role_arn" {
  value = aws_iam_role.codepipeline_role.arn
}


output "codebuild_plan_project_name" {
  value = aws_codebuild_project.terraform_plan.name
}

output "codebuild_apply_project_name" {
  value = aws_codebuild_project.terraform_apply.name
}
output "pipeline_name" {
  value = aws_codepipeline.this.name
}
