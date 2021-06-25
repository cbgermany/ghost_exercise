# Image Creation
This part of the project is used to create the VM image that will run Ghost.  The build process follows the recommended
instructions detailed at https://ghost.org/docs/install/ubuntu/#install-ghost

The packer module will provision an Ubuntu 20_04-lts from Azure Marketplace and the scripts will then perform the following:

- Update the Ubuntu patches
- Install Nginx
- Install node.js
- Install Ghost-Cli

# Validate Packer
packer validate -force -var-file=./var_files/dev.pkrvars.hcl ghost.pkr.hcl

# Run Packer
packer build -force -var-file=./var_files/dev.pkrvars.hcl ghost.pkr.hcl

# Notes
Typical build time for this should be arount 5 to 6 minutes.

The base image will then be used in Azure Auto Scale configuration.

Note MySQL is not installed on this image as Azure MySQL will be used as the database.