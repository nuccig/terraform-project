resource "aws_s3_bucket" "bucket_s3" {
  count = var.create_bucket ? 1 : 0

  bucket = "bucket-s3-nuccig-${var.environment == "dev" ? "development" : "default"}"
  region = var.location != "" ? var.location : "us-east-1"

}

resource "aws_s3_bucket" "bucket_s3_for" {
  # Cria buckets apenas se create_bucket for true
  # e usa additional_bucket_names para criar múltiplos buckets
  for_each = { for i in var.additional_bucket_names : i => i if var.create_bucket }

  bucket = "bucket-s3-nuccig-${each.value}"
  region = var.location != "" ? var.location : "us-east-1"

}
