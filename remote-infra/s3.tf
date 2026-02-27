resource "aws_s3_bucket" "remote_s3" {
  bucket = "my-tf-test-bucket_man"

  tags = {
    Name        = "my-tf-test-bucket_man"
    
  }
}
