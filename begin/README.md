# Begin

This terraform code is simply to create an initial storage acount that will
then be used to store the terraform state for all the remaining terraform
sections.

## Variables

There are two variables defined in this code they are:

- Location 
- Resource Group Name

## Resources

The code will create a resource grouo, a strorage account and a container

## Outputs

| Name | Type | Description |
| ---- | ---- | ----------- |
| primary_account_key | string | The Primary Account Key of the Storage Account |
| secondary_account_key | string | The Secondary Account Key of the Storage Account |
