# This is the beginning of the project.  As we want to store the terraform state in a storage account this will
# be a very minimal set of terraform code to create a resource groups and storage account that will be used
# for the storage of the terraform state.

resource "azurerm_resource_group" "begin" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_storage_account" "begin" {
  name                     = "ghostterraformstate"
  resource_group_name      = azurerm_resource_group.begin.name
  location                 = azurerm_resource_group.begin.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  min_tls_version          = "TLS1_2"

  tags = {
    Environment = "staging"
    BillingID = "Charge Code 001"
    Project = "Ghost Exercise"
    Application = "Ghost Blog"
    Customer = "Drone Shuttles Ltd."
  }
}

resource "azurerm_storage_container" "begin" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.begin.name
  container_access_type = "private"
}
