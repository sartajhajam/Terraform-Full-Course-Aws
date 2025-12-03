# A list of bucket names (order matters)
variable "bucket_names_count" {
  type        = list(string)
  description = "Bucket names to create using count"
}
