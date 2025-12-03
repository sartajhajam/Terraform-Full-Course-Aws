provider "aws" {
  region = "ap-south-1"
}

# ---------------------------
# TASK 1: CREATE BUCKETS USING COUNT
# ---------------------------
resource "aws_s3_bucket" "count_buckets" {
  count = length(var.bucket_names_count)

  # Each bucket name selected using its index
  bucket = var.bucket_names_count[count.index]

  tags = {
    CreatedBy = "COUNT demo"
    Index     = count.index
  }
}
