terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.16.1"
    }
  }

  backend "s3" {
    bucket = "terraforms3-remote"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAR6Y7DRQYJU6VWROI"
  secret_key = "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"
}
