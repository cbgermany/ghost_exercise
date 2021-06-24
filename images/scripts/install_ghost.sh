# Create directory: Change `sitename` to whatever you like
sudo mkdir -p /var/www/sitename

if [[ $? != 0 ]]
then
    echo "Error: Failed to create directory for ghost, configuration will now stop"
    exit 1
fi

# Set directory owner: Replace <user> with the name of your user
sudo chown ghostadmin:ghostadmin /var/www/sitename
if [[ $? != 0 ]]
then
    echo "Error: Failed to set ownership for ghost, configuration will now stop"
    exit 1
fi

# Set the correct permissions
sudo chmod 775 /var/www/sitename
if [[ $? != 0 ]]
then
    echo "Error: Failed to set permissions for ghost, configuration will now stop"
    exit 1
fi

# Then navigate into it
cd /var/www/sitename


