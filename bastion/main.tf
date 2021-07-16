# Create a bastion server Public IP

resource "azurerm_public_ip" "bastion" {
  name                = format("%s-%s", data.terraform_remote_state.common.outputs.environment, "bastionPIP")
  location            = data.terraform_remote_state.common.outputs.location.default
  resource_group_name = data.terraform_remote_state.common.outputs.resource_groups.network
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = merge(data.terraform_remote_state.common.outputs.tags,
         tomap({"Component" = "Bastion"}))
}

# Create a bastion server in the Frontend Subnet
resource "azurerm_bastion_host" "bastion" {
  name                = format("%s-%s", data.terraform_remote_state.common.outputs.environment, "bastion")
  location            = data.terraform_remote_state.common.outputs.location.default
  resource_group_name = data.terraform_remote_state.common.outputs.resource_groups.network

  ip_configuration {
    name                 = "ipconfig"
    subnet_id            = data.terraform_remote_state.network.outputs.subnets.subnet-3.id
    public_ip_address_id = azurerm_public_ip.bastion.id
  }

  tags = merge(data.terraform_remote_state.common.outputs.tags,
         tomap({"Component" = "Bastion"}))
}