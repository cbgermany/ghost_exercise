output "subnets" {
    value = data.terraform_remote_state.network.outputs.subnets.subnet-1.id
}

output "url" {
    value = module.ghost_scale_set.vmss_public_ip
}