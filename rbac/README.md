# RBAC

This is an azure CLI command to create the service principal that will be used for the
automation.  The SP will be called automation_SP and will have the Contributor role access.

This command can be run from Azure Cloud Shell or after you have logged into the subscription using
the azurr cli.

## Resources

Creates an Azure AD Serive Principal called automayion_SP 
provider.

## Outputs

| Name | Type | Description |
| ---- | ---- | ----------- |
| client_id | string | The client_id of the service principal |
| client_secret | string | The password for thr Service Principal, don't loose it |
| tenant_id| string | The tenant_id for this subscription |
| subscription_id | string | The Subscription id for this Azure subscription |
