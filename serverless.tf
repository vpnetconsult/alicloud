
resource "alicloud_oss_bucket" "demo" {
   bucket = "demo"
}

resource "alicloud_oss_bucket_object" "demo" {
   bucket = alicloud_oss_bucket.demo.bucket
   key = "function/demo.zip"
   source = "demo.zip"
}
