terraform {
  required_providers {
    alicloud = {
      source = "hashicorp/alicloud"
      version = "1.135.0"
    }
  }
}

provider "alicloud" {
  region = var.alicloud_region
}
