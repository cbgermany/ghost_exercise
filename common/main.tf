###############################################################################
# main.tf                                                                     #
#                                                                             #
# This file defines the terraform items that will be changed when the         #
# workspace is changed.  There are two workspaces defined one for development #
# the default workspace, and onr called prod for production.                  #
#                                                                             #
###############################################################################

###############################################################################
# Configure Module                                                            #
###############################################################################

locals {
  # Specify pairs of workspaces for Dev and Prod also add the Disaster Recovery elements.
  workspaces = lookup(
    {
      # Workspces will be default for development and prod for production.
      default = "default"
      prod    = "prod"
    },
    terraform.workspace
  )

  # The production will run ik UK South, the DR environment will run in UK West.  Note that UK West does not have Availability Zones
  # at this time.
  location = lookup(
    {
      default = {
          default = "uksouth" # Location for the Development resources
          dr      = "ukwest"  # Location for the Development DR resources
      }
      prod = {
          default = "uksouth"  # Location for the Prod resources
          dr      = "ukwest"  # Location for the Prod DR resources
      }
    },
    terraform.workspace
  )

  # Set up two resources groups 1 for the network and one for the VM, databases etc
  resource_groups = lookup(
    {
      # Development Resource Groups
      default = {
        default = "Ghost"
        network = "Ghostnetwork"
      }
      # Production Resource Groups
      prod = {
        default = "GhostProd"
        network = "GhostProdnetwork"
      }
    },
    terraform.workspace
  )

  # The name of the primary VNET
  vnet_name = lookup(
    {
      default = "dev_primary_vnet"
      prod    = "prod_primary_vnet"
    },
    terraform.workspace
  )

  address_apace = lookup(
    {
      # VNET CIDR blocks
      default = "10.0.0.0/20"
      prod    = "10.1.0.0/20"
    },
    terraform.workspace
  )

  # Subnet CIDR blocks for dev/test abd production
  subnets_cidr = lookup(
    {
      default = {
        FrontEnd           = "10.0.0.0/24"
        BackEnd            = "10.0.1.0/24"
        AzureBastionSubnet = "10.0.2.0/27"
      }
      prod = {
        FrontEnd           = "10.1.0.0/24"
        BackEnd            = "10.1.1.0/24"
        AzureBastionSubnet = "10.1.2.0/27"
      }
    },
    terraform.workspace
  )

  environment = lookup(
    {
      default = "Dev"
      prod    = "Prod"
    },
    terraform.workspace
  )

  billingid = lookup(
    {
      default = "Charge Code 001"
      prod    = "Charge Code 002"
    },
    terraform.workspace
  )

  project = lookup(
    {
      default = "Ghost Exercise Dev"
      prod    = "Ghost Exercise Prod"
    },
    terraform.workspace
  )

  customer = lookup(
    {
      default = "Drone Shuttles Ltd."
      prod    = "Drone Shuttles Ltd."
    },
    terraform.workspace
  )

  application = lookup(
    {
      default = "Ghost Blog"
      prod    = "Ghost Blog"
    },
    terraform.workspace
  )

  tags = {
    Environment   = local.environment
    BillingID     = local.billingid
    Project       = local.project
    Customer     = local.customer
    Application  = local.application
  }
}
