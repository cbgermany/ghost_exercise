# Set up the main VNET, Subnets and NSGs used by the Ghost project

# Create the Primary Network
module "vnet" {
    #source = "../../modules/Terraform-vnet"
    source = "git::https://github.com/cbgermany/Terraform-Vnet.git?ref=v0.1"

    name           = data.terraform_remote_state.common.outputs.vnet_name
    location       = data.terraform_remote_state.common.outputs.location.default
    resource_group = data.terraform_remote_state.common.outputs.resource_groups.network
    address_space  = [data.terraform_remote_state.common.outputs.address_space]

    subnets = {
      subnet-1 = {
        name              = "FrontEnd"
        cidr              = data.terraform_remote_state.common.outputs.subnets_cidr.FrontEnd,
        service_endpoints = []
      },
      subnet-2 = {
        name              = "BackEnd",
        cidr              = data.terraform_remote_state.common.outputs.subnets_cidr.BackEnd,
        service_endpoints = []
      }
    }

    create_ddos     = false

    common_tags     = data.terraform_remote_state.common.outputs.tags
}