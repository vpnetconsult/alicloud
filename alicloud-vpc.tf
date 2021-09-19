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
  cidr_block = "10.0.0.0/16"
}

resource "alicloud_vswitch" "vsw-web" {
  name              = "subnet-tcloud"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"
}
