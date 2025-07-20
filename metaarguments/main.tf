terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "6.4.0"
      configuration_aliases = [aws.useast]
    }
  }

  backend "s3" {
    bucket = "nuccig-remote-state-bucket-example"
    key    = "aws-metaarguments/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Environment = "example"
      Project     = "metaarguments"
      ManagedBy   = "Terraform"
      Owner       = "nuccig"
    }
  }
}

provider "aws" {
  alias  = "useast"
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "example"
      Project     = "metaarguments"
      ManagedBy   = "Terraform"
      Owner       = "nuccig"
    }
  }
}
