
# Create a new user and follow prompts
sudo adduser --disabled-password --gecos "Ghost Admin User" ghostadmin
if [[ $? != 0 ]]
then
    echo "Error: Failed to create ghostadmin user, configuration will now stop"
    exit 1
fi

# Add user to superuser group to unlock admin privileges
sudo usermod -aG sudo ghostadmin
if [[ $? != 0 ]]
then
    echo "Error: Failed to add sudo for ghostadmin user, configuration will now stop"
    exit 1
fi
