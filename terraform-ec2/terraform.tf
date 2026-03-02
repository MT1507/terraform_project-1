terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }

  backend "s3" {
    bucket = "my-tf-test-bucket-man"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "my-tf-test-table"
  }
}
