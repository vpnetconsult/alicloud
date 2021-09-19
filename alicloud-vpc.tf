terraform {
  required_providers {
    alicloud = {
      source = "hashicorp/alicloud"
      version = "1.135.0"
    }
  }
}

resource "alicloud_vpc" "vpc" {
  name       = "tcloud-resource"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "vsw-web" {
  name              = "subnet-tcloud"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "172.16.0.0/24"
  availability_zone = "eu-central-1"
}
