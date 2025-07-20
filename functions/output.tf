output "bucket_names_splat" {
  value = values(aws_s3_bucket.bucket_s3_for)[*].id
}
