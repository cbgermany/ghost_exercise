output "primary_access_key" {
  value = azurerm_storage_account.begin.primary_access_key
  sensitive = true
}

output "secondary_access_key" {
  value = azurerm_storage_account.begin.secondary_access_key
  sensitive = true
}


