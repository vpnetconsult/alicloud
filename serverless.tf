resource "alicloud_fc_service" "vpnet_service" {
  service_name = "OpenAPI Service"
  description  = "My Function Compute service"
}

resource "alicloud_api_gateway_instance" "vpnet_api_gateway_instance" {
  name = "APIG"
}

resource "alicloud_api_gateway_api" "vpnet_api" {
  name        = "queryProductOfferingList"
  description = "My API"

  service_type = "FunctionCompute"
  backend_service_config {
    region = local.zone
    service_name = alicloud_fc_service.vpnet_service.service_name
    function_name = "Function for OpenAPI"
    invocation_type = "Sync"
  }

  request_config {
    request_protocol = "HTTP,HTTPS"
    request_http_method = "GET"
    request_path = "/vpnet"
  }

  visibility = "PRIVATE"
  group_id = alicloud_api_gateway_instance.vpnet_api_gateway_instance.group_id
}

resource "alicloud_api_gateway_openapi" "vpnet_openapi" {
  name = "TMF620"
  description = "My OpenAPI specification"
  group_id = alicloud_api_gateway_instance.vpnet_api_gateway_instance.group_id
  region = local.zone
  openapi_data = filebase64("<path_to_your_openapi_file>")
}

