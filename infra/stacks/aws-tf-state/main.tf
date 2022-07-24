terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  //Everything configured by ENV< including AWS_REGION
}

module "r15cookie-state" {
  source = "../../modules/backend-aws"
  s3_bucket_name = "terraform-r15cookie"
  dynamo_table_name = "terraform-r15cookie"
}