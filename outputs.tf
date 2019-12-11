locals {
  this_slb_server_group_id      = alicloud_slb_server_group.this.id
  this_slb_server_group_name    = alicloud_slb_server_group.this.name
  this_slb_server_group_servers = alicloud_slb_server_group.this.servers
}

output "this_slb_server_group_id" {
  value = local.this_slb_server_group_id
}

output "this_slb_server_group_name" {
  value = local.this_slb_server_group_name
}

output "this_slb_server_group_servers" {
  value = local.this_slb_server_group_servers
}
