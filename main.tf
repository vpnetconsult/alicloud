terraform {
  required_providers {
    alicloud = {
      source = "hashicorp/alicloud"
      version = "1.135.0"
    }
  }
}

provider "alicloud" {}

# Some useful variables to reduce copy-paste, you can add whatever you like
locals {
  prefix   = "worker"
  domain   = "vpnet.app"
  hostname = "${local.prefix}.${local.domain}"
  zone     = "eu-central-1"
}
