variable "step_function_name" {
  description = "Name of the Step Function"
  type        = string
}

variable "lambda_arns" {
  description = "Map of lambda ARNs from lambda module"
  type        = map(string)
}

variable "steps" {
  description = "Ordered list of steps for the workflow"
  type = list(object({
    name       = string
    lambda_key = string
  }))
}
