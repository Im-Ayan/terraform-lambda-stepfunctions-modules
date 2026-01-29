resource "aws_iam_role" "lambda_role" {
  name = "lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "basic_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "this" {
  for_each = var.lambdas

  function_name = each.value.function_name
  runtime       = var.runtime
  handler       = each.value.handler

  s3_bucket = each.value.s3_bucket
  s3_key    = each.value.s3_key

  memory_size = each.value.memory
  timeout     = each.value.timeout

  role = aws_iam_role.lambda_role.arn
}
