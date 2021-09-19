resource "alicloud_vpc" "vpc" {
  vpc_name       = "tcloud-resource"
  cidr_block = "172.16.0.0/12"
}

output "default-vpc-id" {
  value = alicloud_vpc.vpc.id
}

resource "alicloud_vswitch" "vswitch" {
  # Use the VPC's ID
  vpc_id            = alicloud_vpc.vpc.id
  # Set the CIDR for this switch, must be in the CIDR of the VPC
  cidr_block        = "172.16.0.0/24"
  # As the VPC is a region-specified resource, switches are for zones
  zone_id = local.zone
}

output "subnet_cidr_blocks" {
  description = "The vswitch cidr block"
  value = alicloud_vswitch.vswitch.*.cidr_block
}

