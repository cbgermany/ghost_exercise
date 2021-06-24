# Image Creation
This part of the project is used to create the VM image that will run Ghost.  The build process follows the recommended
instructions detailed at https://ghost.org/docs/install/ubuntu/#install-ghost

The packer module will provision an Ubuntu 20_04-lts from Azure Marketplace and the scripts will then perform the following:

- Create a ghostadmin user
- Update the Ubuntu patches
- Install Nginx
- Install MySql
- Assign a password to the mysql root user
- Install node.js
- Install Ghost-Cli
- Install Ghost

# Validate Packer
packer validate -force -var-file=./var_files/dev.pkrvars.hcl ghost.pkr.hcl

# Run Packer
packer build -force -var-file=./var_files/dev.pkrvars.hcl ghost.pkr.hcl
