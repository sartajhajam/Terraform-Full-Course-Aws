# A list of bucket names (order matters) for Task 1 
variable "bucket_names_count" {
  type        = list(string)
  description = "Bucket names to create using count"
}

 # Task 2 Create two S3 buckets using for_each with set(string).
 # A set of bucket names (order does NOT matter)
variable "bucket_names_each" {
  type        = set(string)
  description = "Bucket names to create using for_each"
}
