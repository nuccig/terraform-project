terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Owner       = "Gustavo Nucci"
      ManagedBy   = "terraform"
      Environment = "example"
      Project     = "terraform-example"
    }
  }
}