
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}


provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  profile    = "default"
  region     = "us-east-1"
}

provider "random" {
  version = "~> 2.2.1"
}
