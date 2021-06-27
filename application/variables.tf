# This is used to access the Azure Key Vault and extract the secret for the password
variable "keyvault_name" {
    description = "The name of the key vault where secrets will be stored"
    type        = string
    default     = "GhostSecrets"
}

variable "key_vault_resource_group_name" {
    description = "The name of the key vault resource group"
    type        = string
    default     = "GhostRG"
}

variable "unix_admin_account" {
    description = "The name of the unix admin account"
    type        = string
    default     = "Unixadmin"
}