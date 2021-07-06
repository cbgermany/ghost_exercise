output "subnets" {
    value = data.terraform_remote_state.network.outputs.subnets.subnet-1.id
}

output "url" {
    value = module.ghost_scale_set.vmss_public_ip
}

output "server_name" {
    value = data.terraform_remote_state.database.outputs.mysql_server.name
}

output "database_name" {
    value = data.terraform_remote_state.database.outputs.mysql_database.name
}