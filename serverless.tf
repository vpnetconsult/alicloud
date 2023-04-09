# Use the kubernetes module to create a serverless Kubernetes cluster
module "vpnet_serverless" {
  source  = "terraform-alicloud-modules/kubernetes/alicloud"
  version = "3.3.0"

  cluster_name            = "vpnet_serverless"
  region_id               = local.zone
  zone_ids                = [local.zone]
  vpc_id                  = alicloud_vpc.vpc.id
  vswitch_ids             = [alicloud_vswitch.vswitch.id]
  nat_gateway             = true
  num_of_nodes            = 3
  kubernetes_version      = "1.21.2-aliyun.1"
  enable_auto_renew       = true
  enable_dashboard        = true
  enable_nginx_ingress    = true
  enable_log_service      = true
  enable_private_zone     = true
  enable_private_endpoint = true
  tags                    = {
    Environment = "production"
  }
}

# Output the Kubernetes cluster and Load Balancer details
output "cluster_details" {
  value = {
    api_server_endpoint = alicloud_cs_managed_kubernetes.vpnet_serverless.endpoint
    cluster_id          = alicloud_cs_managed_kubernetes.vpnet_serverless.id
    kubeconfig          = alicloud_cs_managed_kubernetes.vpnet_serverless.kube_config_raw
  }
}
