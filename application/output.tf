output "subnets" {
    value = data.terraform_remote_state.network.outputs.subnets.subnet-1.id
}