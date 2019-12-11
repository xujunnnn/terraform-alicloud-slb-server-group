provider "alicloud" {
  version              = ">=1.56.0"
  region               = var.region != "" ? var.region : null
  configuration_source = "terraform-alicloud-modules/slb-server-group"
}

resource "alicloud_slb_server_group" "this" {
  load_balancer_id = var.slb
  name             = var.name
  dynamic "servers" {
    for_each = var.servers
    content {
      server_ids = split(",", servers.value.server_ids)
      port       = servers.value.port
      weight     = lookup(servers.value, "weight", 100)
      type       = lookup(servers.value, "type", "ecs")
    }
  }
}
