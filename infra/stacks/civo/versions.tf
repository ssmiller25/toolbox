terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    civo = {
      source = "civo/civo"
    }
  }

  backend "s3" {
    bucket = "terraform-r15cookie"
    key    = "stacks/civo"
    dynamodb_table = "terraform-r15cookie"
    region = "us-east-2"
  }

}

provider "aws" {

}

provider "civo" {
  region = "NYC1"
}