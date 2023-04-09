# Create a Serverless Kubernetes cluster
resource "alicloud_cs_serverless_kubernetes_cluster" "vpnet_serverless" {
  name             = "vpnet_serverless"
  vswitch_id       = alicloud_vswitch.vswitch.id
  nat_gateway      = true
  kubernetes_version = "1.21.2-aliyun.1"
  num_of_nodes     = 3
  region_id        = local.zone
}


# Output the Kubernetes cluster details
output "cluster_details" {
  value = {
    api_server_endpoint = alicloud_cs_serverless_kubernetes_cluster.vpnet_serverless.api_server_endpoint
    cluster_id          = alicloud_cs_serverless_kubernetes_cluster.vpnet_serverless.cluster_id
    kubeconfig          = alicloud_cs_serverless_kubernetes_cluster.vpnet_serverless.kubeconfig
  }
}
