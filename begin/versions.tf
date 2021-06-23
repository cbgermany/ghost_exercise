# Version of Terraform Code to be user for this project

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.1"
    }
  }
}

provider "azurerm" {
  features {}
}