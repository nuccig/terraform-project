#terraform -chdir=example_s3_tf init

resource "aws_s3_bucket" "bucket_s3" {

  bucket = "nuccig-terraform-example-bucket"

}