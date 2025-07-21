terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }

  backend "s3" {
    bucket = "nuccig-remote-state-bucket-example"
    key    = "aws-extra/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "${terraform.workspace}"
      ManagedBy   = "Terraform"
      Owner       = "nuccig"
    }
  }
}
