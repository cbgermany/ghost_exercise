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
        service_endpoints = ["Microsoft.Sql"]
      },
      subnet-2 = {
        name              = "BackEnd",
        cidr              = data.terraform_remote_state.common.outputs.subnets_cidr.BackEnd,
        service_endpoints = []
      },
      subnet-3 = {
        name              = "AzureBastionSubnet",
        cidr              = data.terraform_remote_state.common.outputs.subnets_cidr.AzureBastionSubnet,
        service_endpoints = []
      },      
    }

    create_ddos     = false

    common_tags     = data.terraform_remote_state.common.outputs.tags
}

module "frontend_nsg" {
    #source = "../../modules/Terraform-nsg"
    source = "git::https://github.com/cbgermany/Terraform-nsg.git?ref=v0.1"

    name = format("%s-%s", data.terraform_remote_state.common.outputs.environment, "Frontend-NSG")
    location       = data.terraform_remote_state.common.outputs.location.default
    resource_group = data.terraform_remote_state.common.outputs.resource_groups.network

    common_tags     = data.terraform_remote_state.common.outputs.tags

    nsg_rules = {
      "Allow_Http" = {
        priority                   = "1000",
        direction                  = "Inbound",
        access                     = "Allow",
        protocol                   = "Tcp",
        source_port_range          = "*",
        destination_port_range     = "80",
        source_address_prefix      = "*",
        destination_address_prefix = "*"
      },
      "Allow_Https" = {
        priority                   = "1010",
        direction                  = "Inbound",
        access                     = "Allow",
        protocol                   = "Tcp",
        source_port_range          = "*",
        destination_port_range     = "443",
        source_address_prefix      = "*",
        destination_address_prefix = "*"
      }
    }
}

# Assign the Security Group to the Subnets
resource "azurerm_subnet_network_security_group_association" "frontend" {
  subnet_id                 = module.vnet.subnets.subnet-1.id
  network_security_group_id = module.frontend_nsg.nsg_id
}