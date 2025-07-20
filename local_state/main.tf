terraform {
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
      Environment = "Development"
      Project     = "ExampleProject"
      ManagedBy   = "Terraform"
    }
  }

}
