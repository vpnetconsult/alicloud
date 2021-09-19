provider "alicloud" {}

# Some useful variables to reduce copy-paste, you can add whatever you like
locals {
  prefix   = "worker"
  domain   = "vpnet.app"
  hostname = "${local.prefix}.${local.domain}"
  zone     = "eu-central-1a"
}
