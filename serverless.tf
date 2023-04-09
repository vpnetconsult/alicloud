resource "alicloud_api_gateway" "vpnet_api_gateway" {
  name          = "vpnet-api-gateway"
  description   = "My API Gateway"
  internet      = true
  instance_type = "SLB"
  vpc_id        = alicloud_vpc.vpc.id
  vswitch_id    = alicloud_vswitch.vswitch.id
}

resource "alicloud_api_group" "vpnet_api_group" {
  name = "vpnet-api-group"
  description = "My API Group"
  api_gateway_id = alicloud_api_gateway.vpnet_api_gateway.id
}

resource "alicloud_api_gateway_api" "vpnet_api" {
  name = "vpnet-api"
  description = "My API"
  group_id = alicloud_api_group.vpnet_api_group.id
  visibility = "PUBLIC"
  auth_type = "APP"
  request_config {
    request_protocol = "https"
    request_http_method = "GET"
    request_path = "/test"
    body_format = "FORM"
    post_body_description = "test body description"
  }
  service_config {
    service_protocol = "http"
    service_http_method = "GET"
    service_path = "/test"
  }
}
