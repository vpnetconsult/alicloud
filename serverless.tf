resource "alicloud_cs_serverless_kubernetes" "serverless" {
  name_prefix                    = var.name
  vpc_id                         = alicloud_vpc.vpc.id
  vswitch_ids                    = [alicloud_vswitch.vswitch.id]
  new_nat_gateway                = true
  endpoint_public_access_enabled = true
  deletion_protection            = false

  load_balancer_spec      = "slb.s2.small"
  time_zone               = local.zone
  service_cidr            = "172.21.0.0/20"
  service_discovery_types = ["PrivateZone"]
  # Enable log service, A project named k8s-log-{ClusterID} will be automatically created
  logging_type = "SLS"
  # Select an existing sls project
  # sls_project_name             = ""

  # tags 
  tags = {
    "k-aa" = "v-aa"
    "k-bb" = "v-aa"
  }
