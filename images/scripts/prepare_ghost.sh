# This script creats a ghostadmin user and then runs the initial install of ghost without performing a full setup

# Create a new user and follow prompts
sudo adduser --disabled-password --gecos "Ghost Admin User" ghostadmin
if [[ $? != 0 ]]
then
    echo "Error: Failed to create ghostadmin user, configuration will now stop"
    exit 1
fi

# Create directory: Change `sitename` to whatever you like
sudo mkdir -p /var/www/blog
if [[ $? != 0 ]]
then
    echo "Error: Failed to create directory for ghost, configuration will now stop"
    exit 1
fi

# Set directory owner: Replace <user> with the name of your user
sudo chown ghostadmin:ghostadmin /var/www/blog
if [[ $? != 0 ]]
then
    echo "Error: Failed to set ownership for ghost, configuration will now stop"
    exit 1
fi

# Set the correct permissions
sudo chmod 775 /var/www/blog
if [[ $? != 0 ]]
then
    echo "Error: Failed to set permissions for ghost, configuration will now stop"
    exit 1
fi
