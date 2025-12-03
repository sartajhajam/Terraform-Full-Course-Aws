# ---------------------------
# OUTPUT USING FOR LOOP - BUCKET NAMES (COUNT)
# ---------------------------
output "count_bucket_names" {
  description = "List of bucket names created using count"
  value = [
    for bucket in aws_s3_bucket.count_buckets :
    bucket.bucket
  ]
}

# ---------------------------
# OUTPUT USING FOR LOOP - BUCKET IDS (FOR_EACH)
# ---------------------------
output "foreach_bucket_ids" {
  description = "List of bucket IDs created using for_each"
  value = {
    for key, bucket in aws_s3_bucket.foreach_buckets :
    key => bucket.id
  }
}
