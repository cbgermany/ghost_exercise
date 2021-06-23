# Create the Service principal that will be used by Paker and Terraform to create resources
# in Azure.  The SP will be created with the Microsoft Contributor role
#
# The SP will be password based so captuture the following items:
#{
#    "client_id": "",
#    "client_secret": "",
#    "tenant_id": ""
#}
# In addition we also need the Subscription Id

az ad sp create-for-rbac --name "automation_sp" --role "contributor" --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"

az account show --query "{ subscription_id: id }"

