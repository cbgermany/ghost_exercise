# Version of Terraform Code to be user for this project

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.1"
    }
  }

  backend "azurerm" {
      resource_group_name  = "GhostTerraformRg"
      storage_account_name = "ghostterraformstate"
      container_name       = "tfstate"
      key                  = "scaleset.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}