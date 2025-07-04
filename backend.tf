terraform {
  backend "s3" {
    bucket         = "prince-terraform-state-my42"
    key            = "env:prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prince-tf-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}
