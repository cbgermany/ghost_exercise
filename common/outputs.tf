# These items are being output so that they can be accessed by any other terraform module

output "tenant_id" {
  value = "27b17912-3c4a-4783-88e8-5fd401dd82bc"
}

output "environment" {
  value = local.environment
}

output "billing_id" {
  value = local.billing_id
}

output "project" {
  value = local.project
}

output "workspaces" {
  value = local.workspaces
}

output "location" {
  value = local.location
}

output "resource_groups" {
  value = local.resource_groups
}

output "tags" {
  value = local.tags
}

