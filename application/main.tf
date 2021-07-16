#Generate a random string for the domain name as I don't want to use a real domain for this exercise
#Will use the Microsoft default
resource "random_string" "fqdn" {
  length  = 6
  special = false
  upper   = false
  number  = false
}

module "ghost_scale_set" {
  #source = "../../modules/Terraform-scale-set"
  source = "git::https://github.com/cbgermany/Terraform-scale-set.git?ref=v0.2"

  name            = format("%s-%s", data.terraform_remote_state.common.outputs.environment, "ghost")
  location        = data.terraform_remote_state.common.outputs.location.default
  resource_group  = data.terraform_remote_state.common.outputs.resource_groups.default

  domain_name_label    = random_string.fqdn.result

  image_name           = "Ghost_Ubuntu_20_04_lts_Image"
  image_resource_group = "GhostRG"

  sku       = "Standard_D2s_v3"
  instances = 1

  ghost_admin_user     = "ghostadmin"
  ghost_admin_password = data.azurerm_key_vault_secret.unix_admin_pass.value

  db_svr_admin_user     = format("%s@%s", data.terraform_remote_state.database.outputs.mysql_server.administrator_login,
                                          data.terraform_remote_state.database.outputs.mysql_server.name)
  db_svr_admin_password = data.azurerm_key_vault_secret.unix_admin_pass.value

  subnet_id = data.terraform_remote_state.network.outputs.subnets.subnet-1.id

  # Parameters for Cloudinit to install Ghost
  url       = format("%s.%s.%s", random_string.fqdn.result, 
                                 data.terraform_remote_state.common.outputs.location.default,
                                 "cloudapp.azure.com")
  admin_url = ""
  endpoint  = format("%s.%s", data.terraform_remote_state.database.outputs.mysql_server.name, 
                              "mysql.database.azure.com")
  database  = data.terraform_remote_state.database.outputs.mysql_database.name

  sslemail = "example@myemail.com"

  common_tags = data.terraform_remote_state.common.outputs.tags

}