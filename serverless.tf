
resource "alicloud_fc_service" "vpnet_service" {
  description  = "My Function Compute service"
}

resource "alicloud_fc_function" "vpnet_function" {
  handler          = "index.handler"
  runtime          = "nodejs10"
  memory_size      = 128
  timeout          = 3
}

