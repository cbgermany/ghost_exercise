module "ghost_scale_set" {
  source = "../../modules/Terraform-scale-set"
  #source = "git::https://github.com/cbgermany/Terraform-scale-set.git?ref=v0.1"

  name            = format("%s-%s", data.terraform_remote_state.common.outputs.environment, "ghost")
  location        = data.terraform_remote_state.common.outputs.location.default
  resource_group  = data.terraform_remote_state.common.outputs.resource_groups.default

  image_name           = "Ghost_Ubuntu_20_04_lts_Image"
  image_resource_group = "GhostRG"

  application_port = "443"

  sku       = "Standard_D2s_v3"
  instances = 1

  admin_user     = "ghostadmin"
  admin_password = data.azurerm_key_vault_secret.unix_admin_pass.value

  subnet_id = data.terraform_remote_state.network.outputs.subnets.subnet-1.id

  common_tags = data.terraform_remote_state.common.outputs.tags

}