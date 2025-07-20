variable "tags" {
  description = "Default tags to apply on azure resources"
  type        = map(string)
  default = {
    Environment = "example"
    Project     = "remote-state"
    ManagedBy   = "Terraform"
    Owner       = "nuccig"
  }
}
