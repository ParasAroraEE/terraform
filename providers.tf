terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "<terraform-state-bucket>"
    key            = "global/lambda/${var.lambda_name}/terraform.tfstate"
    region         = "${var.region}"

  }
}


provider "aws" {
  region = var.region
}