resource "aws_iam_role" "sfn_role" {
  name = "${var.step_function_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "states.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "invoke_lambda" {
  role = aws_iam_role.sfn_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "lambda:InvokeFunction"
      Resource = values(var.lambda_arns)
    }]
  })
}

resource "aws_sfn_state_machine" "this" {
  name     = var.step_function_name
  role_arn = aws_iam_role.sfn_role.arn

  definition = templatefile(
    "${path.module}/definition.tpl.json",
    {
      steps       = var.steps
      lambda_arns = var.lambda_arns
    }
  )
}
