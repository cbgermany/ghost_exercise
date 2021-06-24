
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

variable "location" {
  type    = string
  default = "uksouth"
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
