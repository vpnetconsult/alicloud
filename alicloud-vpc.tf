resource "alicloud_vpc" "default" {
  vpc_name       = "tcloud-resource"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  # Use the VPC's ID
  vpc_id            = alicloud_vpc.default.id
  # Set the CIDR for this switch, must be in the CIDR of the VPC
  cidr_block        = "172.16.0.0/12"
  # As the VPC is a region-specified resource, switches are for zones
  availability_zone = region
}

