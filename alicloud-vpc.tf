terraform {
  required_providers {
    alicloud = {
      source = "hashicorp/alicloud"
      version = "1.93.0"
    }
  }
}

resource "alicloud_vpc" "vpc" {
  name       = "tcloud-resource"
  cidr_block = "172.16.0.0/12"
}


