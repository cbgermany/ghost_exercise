# Common

This module provides outputs for __values commonly used by other Terraform
modules__. The purpose of this is to provide a single place to update such
values.

Note: This module provides different values depending on the currently
active workspace.

## Workspaces

This module supports the following workspaces:

- default: Dev Test
- prod: Production

Note: Changes made to this module should be applied to all workspaces listed
above to ensure consistency.

## Variables

This module does not utilise any variables, all configuration is handled by
local values for convenience.

## Resources

This module does not provision any resources - currently it does not use a
provider.

## Outputs

| Name | Type | Description |
| ---- | ---- | ----------- |
| environment | string | Name of the environment - commonly used for tagging |
| billingid | string | Billing ID for financial reporting - commonly used for tagging |
| Customer | string | Customer Name - commonly used for tagging |
| project | string | Project for financial reporting - commonly used for tagging |
| workspaces | map | Map of Terraform workspaces to uses, e.g. "dev or prod" |
| locations | map | Map of Azure locations to uses, e.g. "UK South" |
| resource_groups | map | Map of resource group names to use, e.g. "Ghost" |
| tags | map | Map of tags common to all resources |
| vnet_name | string | The vnet_name dependant on the workspace |
| address_space | string | The CIDR block for the VNET dependant on the workspace |
| subnet_cidr | map | Cidr block ranges for the subnets |
