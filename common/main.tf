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
          default = "UK South" # Location for the Development resources
          dr      = "UK West"  # Location for the Development DR resources
      }
      prod = {
          default = "UK South"  # Location for the Prod resources
          dr      = "UK West"  # Location for the Prod DR resources
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
