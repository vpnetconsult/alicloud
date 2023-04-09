# Create a Serverless Function Compute service
resource "alicloud_fc_service" "serverless_service" {
  name        = "vpnet-serverless-service"
  description = "My Serverless Service"
  region      = local.zone
  vpc_id      = alicloud_vpc.vpc.id
}

# Create a Serverless Function Compute function
resource "alicloud_fc_function" "serverless_function" {
  service_name = alicloud_fc_service.serverless_service.name
  name         = "vpnet-serverless-function"
  description  = "My Serverless Function"
  runtime      = "nodejs12"
  handler      = "index.handler"
  code_filename = "serverless.zip"
  memory_size  = 128
  timeout      = 60
}

# Create an API Gateway resource for routing HTTP requests to the function
resource "alicloud_api_gateway" "api_gateway" {
  name = "vpnet-api-gateway"
  protocol = "HTTP"
  instance_id = alicloud_fc_service.serverless_service.id
  description = "My API Gateway"
  api_group_name = "vpnet-api-group"
  api_name = "vpnet-api"
  method = "GET"
  request_path = "/vpnet-api"
}

# Output the API Gateway URL
output "api_gateway_url" {
  value = alicloud_api_gateway.api_gateway.invoke_url
}
