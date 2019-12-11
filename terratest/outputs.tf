// Output the id of the server group created
output "this_server_group_id" {
  value = module.slb-server-group.this_slb_server_group_id
}

output "this_server_group_name" {
  value = module.slb-server-group.this_slb_server_group_name
}

output "this_server_group_servers" {
  value = module.slb-server-group.this_slb_server_group_servers
}

