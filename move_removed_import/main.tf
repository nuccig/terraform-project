terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }

  backend "s3" {
    bucket = "nuccig-remote-state-bucket-example"
    key    = "moved-removed-import/terraform.tfstate"
    region = "us-east-1"
  }

  required_version = ">= 1.7"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "example"
      Project     = "remote-state"
      ManagedBy   = "Terraform"
      Owner       = "nuccig"
    }
  }
}
