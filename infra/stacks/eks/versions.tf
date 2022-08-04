terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "terraform-r15cookie"
    key    = "stacks/eks"
    dynamodb_table = "terraform-r15cookie"
    region = "us-east-2"
  }

}

provider "aws" {

}
