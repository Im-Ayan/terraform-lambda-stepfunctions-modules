output "lambda_arns" {
  description = "Map of lambda ARNs"
  value = {
    for key, fn in aws_lambda_function.this : key => fn.arn
  }
}
