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

# ---------------------------
# TASK 2: CREATE BUCKETS USING FOR_EACH
# ---------------------------
resource "aws_s3_bucket" "foreach_buckets" {
  for_each = toset(var.bucket_names_each)

  # each.value contains the current bucket name
  bucket = each.value

  tags = {
    CreatedBy = "FOR_EACH demo"
    Name      = each.value
  }
}

