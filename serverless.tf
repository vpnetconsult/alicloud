
resource "alicloud_oss_bucket" "vpnet_demo" {
   bucket = "vpnet_demo"
}

resource "alicloud_oss_bucket_object" "demo" {
   bucket = alicloud_oss_bucket.vpnet_demo.bucket
   key = "function/demo.zip"
   source = "demo.zip"
}
