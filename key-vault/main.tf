# Create the key vault and add owner and service principals access to keys and secrets
module "key-vault" {
    source = "../../modules/Terraform-key-vault"

    resource_group = "testrg"
    location       = data.terraform_remote_state.common.outputs.location.default
    name           = "ghosttestkeyvault"
    tenant_id      = data.azurerm_client_config.current.tenant_id

    access_policies = {
      owner = {
        object_id = "98e7f46d-c45f-4c36-8c0b-5a63126026bb"
        keys = ["create", "delete", "get", "list","verify","sign"],
        secrets = ["set","get","list","delete"]

      }
      ghost_app  = {
        object_id = data.azuread_service_principal.automation_sp.object_id
        keys = ["get","list"]
        secrets = ["set", "get", "list"]
      }
    }

    common_tags = data.terraform_remote_state.common.outputs.tags
}

# Generate a random string for a password
resource "random_string" "passwd" {
  length  = 12
  special = true
  upper   = true
  number  = true
}

# Add the secrets for ghostadmin and unixadmin
resource "azurerm_key_vault_secret" "ghostadmin" {
  name         = "ghostadmin"
  value        = random_string.passwd.result
  key_vault_id = module.key-vault.id
}