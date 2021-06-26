module "ghost_scale_set" {
  source = "../../modules/Terraform-scale-set"

  name            = format("%s-%s", data.terraform_remote_state.common.outputs.environment, "ghostvm")
  location        = data.terraform_remote_state.common.outputs.location.default
  resource_group  = data.terraform_remote_state.common.outputs.resource_groups.default

  image_name           = "Ghost_Ubuntu_20_04_lts_Image"
  image_resource_group = "GhostRG"

  application_port = "443"

  sku = "Standard_D2s_v3"

  unix_admin = "unixadmin"
  public_key = "to get"

  subnet_id = "1"

  common_tags = data.terraform_remote_state.common.outputs.tags

}