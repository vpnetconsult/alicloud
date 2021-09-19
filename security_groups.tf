resource "alicloud_security_group" "default" {
  vpc_id = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "http-in" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "ssh-in" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}

# output "sg-vpn-inbound" { value = alicloud_security_group.vpn-inbound.id }
# output "sg-ssh" { value = alicloud_security_group.ssh.id }
# output "sg-vpn-outbound" { value = alicloud_security_group.vpn-outbound.id }
