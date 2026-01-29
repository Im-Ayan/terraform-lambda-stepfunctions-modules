variable "lambdas" {
  description = "Map of lambda definitions"
  type = map(object({
    function_name = string
    s3_bucket     = string
    s3_key        = string
    handler       = string
    memory        = number
    timeout       = number
  }))
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "java11"
}
