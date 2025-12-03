# Configure the AWS Provider
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

# backend configuration
terraform {
  backend "s3" {
    bucket         = "terraform-state-1754513244-state"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1" #Mumbai ,India
    use_lockfile  = "true"
    encrypt        = true
  }
}


# Simple test resource to verify remote backend
resource "aws_s3_bucket" "test_backend" {
  bucket = "test-remote-backend-${random_string.bucket_suffix.result}"

  tags = {
    Name        = "Test Backend Bucket"
    Environment = "dev"
  }
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

// define a variable in 
variable "environment"{
  default = "dev"
  type = string
}

//use the variable in terraform 

  resource "aws_vpc""sample"{
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "sample-vpc-${var.environment}" // accessing the variable 
    }
  }


