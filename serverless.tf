resource "alicloud_api_group" "vpnet_api_group" {
  name              = "vpnet_api_group"
  description       = "My API Group"
  instance_id       = alicloud_api_gateway_instance.vpnet_api_gateway_instance.id
}

resource "alicloud_api_gateway" "vpnet_api_gateway" {
  name        = "vpnet_api_gateway"
  description = "My API Gateway"
  protocol    = "HTTP,HTTPS"
  instance_id = alicloud_api_gateway_instance.vpnet_api_gateway_instance.id
  internet    = true
}
