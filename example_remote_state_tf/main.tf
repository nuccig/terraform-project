terraform {

  required_version = ">= 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.36.0"
    }
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

provider "azurerm" {
  features {

  }
}
