output "vnet" {
  value = module.vnet
}

output "vnet_id" {
  value = module.vnet.id
}

output "subnets" {
  value = module.vnet.subnets
}