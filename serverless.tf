
resource "alicloud_oss_bucket" "vpnet-demo" {
   bucket = "vpnet-demo"
}

resource "alicloud_oss_bucket_object" "demo" {
   bucket = alicloud_oss_bucket.vpnet-demo.bucket
   key = "function/demo.zip"
   source = "demo.zip"
}
