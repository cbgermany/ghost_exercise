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
