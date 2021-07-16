# ghost_exercise
Ghost exercise for Azure

# Introduction
This Git repository is work submitted for Drone Shuttles Ltd. for the automation of a Ghots blog service running in Azure.

# Folder Structure
The repo is organised into seperate folders that have been created for specific tasks required for the full solution.  The purose is detailed below:

* **application**: 
Contains the code to launch an Azure Virtual Machine Scale Set that will run the Ghost application.

* **begin**:
Sets up an initial resource group and storage account.  This project is using terraform state to facilitate the project being structured and worked on independantly.  This section sets up the initial storage account that the other parts of the project then consume.

* **bastion**: 
Creates a bastion server, run this after the Network resources have been created.

* **common**:
Contains the initial set of references that will be used throughout the project such as resource group details, locations etc.  Sets up the values to use Terraform workspaces to allow for development and production environments to share the same code.

* **database**:
This section creates the MySql database

* **images**:
This section contains a packer project to create the Ubuntu imge that will be used in the Azure Scale Sets.

* **key-vault**:
This section creates the Key Vault and access policies for the password secrets

* **network**:
This section creates the VNETs for development and production

* **rbac**:
This section contains the Role Based Access Control scripts required to create the service principals that are then used in the automation.

* **setup**:
Contains scripts not stored in git that hold the environment credentials



