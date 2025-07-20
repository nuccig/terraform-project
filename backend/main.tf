terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }

  backend "s3" {
    bucket         = "nuccig-remote-state-bucket-example"
    key            = "aws-vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"

  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "example"
      Project     = "local-state"
      ManagedBy   = "Terraform"
      Owner       = "nuccig"
    }
  }
}
