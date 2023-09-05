#resource "alicloud_security_group" "tailscale-overlay" {
#  name              = "tailscale-overlay"
#  vpc_id = alicloud_vpc.vpc.id
#}

#resource "alicloud_security_group" "ssh" {
#  name              = "tf-ssh"
#  vpc_id = alicloud_vpc.vpc.id
#}

#resource "alicloud_security_group" "vpn-inbound" {
#  name              = "tf-vpn-inbound"
#  vpc_id = alicloud_vpc.vpc.id
#}

#resource "alicloud_security_group" "vpn-outbound" {
#  name              = "tf-vpn-outbound"
#  vpc_id = alicloud_vpc.vpc.id
#}

#resource "alicloud_security_group_rule" "vpn-udp" {
#  type              = "ingress"
#  ip_protocol       = "udp"
#  description       = "default-ingress"
#  policy            = "accept"
#  port_range        = "1/65535"
#  priority          = 1
#  security_group_id = alicloud_security_group.vpn-inbound.id
#  cidr_ip           = "0.0.0.0/0"
#}

#resource "alicloud_security_group_rule" "ssh-in" {
#  type              = "ingress"
#  ip_protocol       = "tcp"
#  description       = "ssh-access"
#  policy            = "accept"
#  port_range        = "22/22"
#  priority          = 1
#  security_group_id = alicloud_security_group.ssh.id
#  cidr_ip           = "0.0.0.0/0"
#}

#resource "alicloud_security_group_rule" "tf-udp" {
#  type              = "ingress"
#  ip_protocol       = "udp"
#  description       = "tf-udp"
#  policy            = "accept"
#  port_range        = "1/65535"
#  priority          = 1
#  security_group_id = alicloud_security_group.tailscale-overlay.id
#  cidr_ip           = "100.64.0.0/10"
#}

#resource "alicloud_security_group_rule" "tf-tcp" {
#  type              = "ingress"
#  ip_protocol       = "tcp"
#  description       = "tf-tcp"
#  policy            = "accept"
#  port_range        = "1/65535"
#  priority          = 1
#  security_group_id = alicloud_security_group.tailscale-overlay.id
#  cidr_ip           = "100.64.0.0/10"
#}

#resource "alicloud_security_group_rule" "tf-853" {
#  type              = "ingress"
#  ip_protocol       = "tcp"
#  description       = "tf-853"
#  policy            = "accept"
#  port_range        = "853/853"
#  priority          = 1
#  security_group_id = alicloud_security_group.tailscale-overlay.id
#  cidr_ip           = "100.64.0.0/10"
#}

#output "sg-vpn-inbound" { value = alicloud_security_group.vpn-inbound.id }
#output "sg-tailscale" { value = alicloud_security_group.tailscale-overlay.id }
#output "sg-ssh" { value = alicloud_security_group.ssh.id }
#output "sg-vpn-outbound" { value = alicloud_security_group.vpn-outbound.id }
