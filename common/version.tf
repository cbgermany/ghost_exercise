#` Version of Terraform Code to be user for this project

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.1"
    }
  }

#  backend "azurerm" {
#      storage_account_name = "n127cbpstortistate"
#      container_name       = "tfstate"
#      key                  = "common.terraform.tfstate"
#      access_key           = "5xRvNclmoGgRtze20rBWq2eANgMellkerpVp6f7/68QfVTL8VOGHDPDwibOLNTLr+kG/gv2P3xLQ0odN243Jlg=="
#  }
}

