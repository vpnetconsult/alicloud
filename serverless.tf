
resource "alicloud_oss_bucket" "demo" {
   bucket = "demo"
   depends_on = [
      data.external.archive
   ]
}

resource "alicloud_oss_bucket_object" "demo" {
   bucket = alicloud_oss_bucket.demo.bucket
   key = "function/demo.zip"
   source = "demo.zip"
}
