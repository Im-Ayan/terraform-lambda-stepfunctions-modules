########################################
# DEV ENVIRONMENT – Lambda + StepFunction
########################################

####################
# Lambda Module
####################
module "lambdas" {
  source = "../../modules/lambda"

  lambdas = {
    job1 = {
      function_name = "job1-dev"
      s3_bucket     = "lambda-artifacts-dev-01"
      s3_key        = "job1.jar"
      handler       = "com.example.Handler::handleRequest"
      memory        = 1024
      timeout       = 300
    }

    job2 = {
      function_name = "job2-dev"
      s3_bucket     = "lambda-artifacts-dev-01"
      s3_key        = "job2.jar"
      handler       = "com.example.Handler::handleRequest"
      memory        = 1024
      timeout       = 300
    }

    job3 = {
      function_name = "job3-dev"
      s3_bucket     = "lambda-artifacts-dev-01"
      s3_key        = "job3.jar"
      handler       = "com.example.Handler::handleRequest"
      memory        = 2048
      timeout       = 600
    }
  }
}

####################
# Step Function Module
####################
module "etl_step_function" {
  source = "../../modules/step_function"

  step_function_name = "etl-workflow-dev"

  # Output from lambda module
  lambda_arns = module.lambdas.lambda_arns

  # Order matters
  steps = [
    { name = "Job1", lambda_key = "job1" },
    { name = "Job2", lambda_key = "job2" },
    { name = "Job3", lambda_key = "job3" }
  ]
}
