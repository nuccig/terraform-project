output "aws_s3_bucket_infos" {
  value = {
    bucket_name = aws_s3_bucket.example.bucket
    region      = aws_s3_bucket.example.region
    arn         = aws_s3_bucket.example.arn
    id          = aws_s3_bucket.example.id
  }
  description = "Information about the S3 bucket used for local state storage."
}
