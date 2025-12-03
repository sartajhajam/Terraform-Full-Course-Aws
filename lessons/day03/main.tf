terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Configuration options
    region = "ap-south-1" #Mumbai ,India
}

# Create a S3 bucket
resource "aws_s3_bucket" "tf_test_baivab_bucket" {
  bucket = "my-tf-test-baiv-bucket-20251129"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}