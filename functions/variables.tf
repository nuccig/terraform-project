variable "location" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment for the resources"
  type        = string
  default     = "dev"
}

variable "create_bucket" {
  description = "Flag to create the S3 bucket"
  type        = bool
  default     = true
}

variable "additional_bucket_names" {
  description = "List of additional S3 bucket names to create"
  type        = list(string)
  default     = ["additional-bucket-1", "additional-bucket-2"]

}
