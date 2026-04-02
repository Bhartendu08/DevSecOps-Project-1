terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "my-devsecops-project-1-tf"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "devsecops-proj-lock"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
