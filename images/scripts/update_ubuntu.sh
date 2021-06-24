# Update package lists
sudo apt-get update

if [[ $? != 0 ]]
then
    echo "Error: Failed to get the Ubuntu updates, configuration will now stop"
    exit 1
fi

# Update installed packages
sudo apt-get upgrade -y
