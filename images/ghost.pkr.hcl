# This Packer Project is to create a suitable Ubuntu Image that can run the Ghost Open Source Blogging Application.
#
# The image will be based on Ubuntu 20.04 LTS Azure image


variable "build_date" {
  type    = string
  default = "24/06/2021"
}

variable "build_resource_group_name" {
  type    = string
  default = ""
}

variable "build_subnet_name" {
  type    = string
  default = ""
}

variable "build_vnet_name" {
  type    = string
  default = ""
}

variable "build_vnet_resource_group_name" {
  type    = string
  default = ""
}

variable "client_id" {
  type    = string
  default = "${env("ARM_CLIENT_ID")}"
}

variable "client_secret" {
  type    = string
  default = "${env("ARM_CLIENT_SECRET")}"
}

variable "environment" {
  type    = string
  default = "DEV"
}

variable "image_name" {
  type    = string
  default = "Ghost_Ubuntu_20_04_lts_Image"
}

variable "image_offer" {
  type    = string
  default = "0001-com-ubuntu-server-focal"
}

variable "image_publisher" {
  type    = string
  default = "canonical"
}

variable "image_resource_group_name" {
  type    = string
  default = ""
}

variable "image_sku" {
  type    = string
  default = "20_04-lts"
}

variable "image_version" {
  type    = string
  default = "latest"
}

variable "os_image" {
  type    = string
  default = "Ghost Ubuntu 20_04-lts"
}

variable "subscription_id" {
  type    = string
  default = "${env("ARM_SUBSCRIPTION_ID")}"
}

# These are the main tags for the project, oddly map has to be declared type = map(string)
variable "tags" {
  type = map(string)
  default = {
    "Environment" = "Dev"
    "BillingID"   = "Charge Code 001"
    "Project"     = "Ghost Exercise Dev"
    "Customer"    = "Drone Shuttles Ltd."
    "Application" = "Ghost Blog"
    "Component"   = "Packer Build Image"
  }
}

variable "tenant_id" {
  type    = string
  default = "${env("ARM_TENANT_ID")}"
}

variable "version" {
  type    = string
  default = "1.0"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}



source "azure-arm" "ghost" {
  azure_tags = {
    BillingID    = "${var.tags["BillingID"]}"
    Customer     = "${var.tags["Customer"]}"
    Application  = "${var.tags["Application"]}"
    "Build Date" = "${var.build_date}"
    Component    = "${var.tags["Component"]}"
    Environment  = "${var.environment}"
    "OS Image"   = "${var.os_image}"
    Project      = "${var.tags["Project"]}"
    Version      = "${var.version}"
  }
  build_resource_group_name           = "${var.build_resource_group_name}"
  client_id                           = "${var.client_id}"
  client_secret                       = "${var.client_secret}"
  communicator                        = "ssh"
  image_offer                         = "${var.image_offer}"
  image_publisher                     = "${var.image_publisher}"
  image_sku                           = "${var.image_sku}"
  managed_image_name                  = "${var.image_name}"
  managed_image_resource_group_name   = "${var.image_resource_group_name}"
  os_type                             = "Linux"
  subscription_id                     = "${var.subscription_id}"
  tenant_id                           = "${var.tenant_id}"
  ssh_pty                             = true
#  virtual_network_name                = "${var.build_vnet_name}"
#  virtual_network_resource_group_name = "${var.build_vnet_resource_group_name}"
#  virtual_network_subnet_name         = "${var.build_subnet_name}"
  vm_size                             = "${var.vm_size}"
  ssh_username                        = "packer"
}

# Build a Linux image for Ghost
build {
  sources = ["source.azure-arm.ghost"]

  # Execute the following scripts to configure the VM
  provisioner "shell" {
    scripts = [
      "scripts/update_ubuntu.sh",
      "scripts/install_nginx.sh",
      "scripts/install_nodejs.sh",
      "scripts/install_ghost-cli.sh",
      "scripts/prepare_ghost.sh",
      "scripts/amend_sshd.sh",
      "scripts/deprovision.sh"
    ]
  }
}
