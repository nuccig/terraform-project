terraform {

  required_version = ">= 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }

  backend "s3" {
    bucket = "nuccig-remote-state-bucket-example"
    key    = "aws-vm-user-data/terraform.tfstate"
    region = "us-east-1"
  }
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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "nuccig-remote-state-bucket-example"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
