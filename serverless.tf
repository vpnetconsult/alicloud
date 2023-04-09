
resource "alicloud_fc_service" "vpnet_service" {
  service_name = "test"
  description  = "My Function Compute service"
}

resource "alicloud_fc_function" "vpnet_function" {
  function_name    = "vpnet-function"
  service_name     = alicloud_fc_service.vpnet_service.test
  handler          = "index.handler"
  runtime          = "nodejs10"
  memory_size      = 128
  timeout          = 3
  code_file        = "path/to/your/function/code"
  code_filename    = "index.js"
  environment_vars = {
    API_URL = "https://vpnet.app/api"
  }
}

