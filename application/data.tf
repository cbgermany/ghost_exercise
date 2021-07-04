# General common configuration, e.g. locations, tags from terraform state
data "terraform_remote_state" "common" {
  backend   = "azurerm"
  workspace = terraform.workspace
  config    = {
    resource_group_name  = "GhostTerraformRg"
    storage_account_name = "ghostterraformstate"
    container_name       = "tfstate"
    key                  = "common.terraform.tfstate"
  }
}

# Network Configuration for dev and prod network from terraform state
data "terraform_remote_state" "network" {
  backend   = "azurerm"
  workspace = terraform.workspace
  config    = {
    resource_group_name  = "GhostTerraformRg"
    storage_account_name = "ghostterraformstate"
    container_name       = "tfstate"
    key                  = "network.terraform.tfstate"
  }
}

# MySQL Configuration
data "terraform_remote_state" "database" {
  backend   = "azurerm"
  workspace = terraform.workspace
  config    = {
    resource_group_name  = "GhostTerraformRg"
    storage_account_name = "ghostterraformstate"
    container_name       = "tfstate"
    key                  = "database.terraform.tfstate"
  }
}

# Access the key vault to retrieve secrets
data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.key_vault_resource_group_name
}

data "azurerm_key_vault_secret" "unix_admin_pass" {
  name         = var.unix_admin_account
  key_vault_id = data.azurerm_key_vault.keyvault.id
}