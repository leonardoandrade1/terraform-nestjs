provider "aws" {
  region = var.aws_region // TODO add var
}

provider "aws" {
  region = "us-east-1"
  alias  = "useast1"
}

terraform {
  # TODO add s3 backend

  required_providers {
    aws   = ">= 5.80.0"
    local = ">= 2.5.0"
  }
}