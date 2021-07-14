# The database will be held in the default resource group for the workspace

module "database" {
  #source = "../../modules/Terraform-mysql"
  source = "git::https://github.com/cbgermany/Terraform-mysql.git?ref=v0.2"

  mysql_server_name = lower(format("%s-%s", data.terraform_remote_state.common.outputs.environment, "ghostsvr"))
  location          = data.terraform_remote_state.common.outputs.location.default
  resource_group    = data.terraform_remote_state.common.outputs.resource_groups.default

  database_name     = lower(format("%s%s", data.terraform_remote_state.common.outputs.environment, "ghostdb"))

  administrator_login          = var.unix_admin_account
  administrator_login_password = data.azurerm_key_vault_secret.unix_admin_pass.value

  sku_name      = "GP_Gen5_2"
  storage_mb    = 5120
  mysql_version = "5.7"

  ssl_enforcement_enabled           = false
  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = true

  subnet_id = data.terraform_remote_state.network.outputs.subnets.subnet-1.id

  common_tags = data.terraform_remote_state.common.outputs.tags
}
