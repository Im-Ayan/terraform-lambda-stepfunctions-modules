terraform {
  backend "s3" {
    bucket         = "terraform-state-dev-ayan"
    key            = "lambda-stepfunctions/dev.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-dev"
    encrypt        = true
  }
}
