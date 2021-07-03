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

# Get the current context tenent, owner
data "azurerm_client_config" "current" {}

# Get the details for the automation service principal
data "azuread_service_principal" "automation_sp" {
  display_name = "automation_sp"
}