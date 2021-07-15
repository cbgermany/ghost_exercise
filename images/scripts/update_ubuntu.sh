# Update package lists
sudo apt-get update

if [[ $? != 0 ]]
then
    echo "Error: Failed to get the Ubuntu updates, configuration will now stop"
    exit 1
fi

# Update installed packages
sudo apt-get upgrade -y
if [[ $? != 0 ]]
then
    echo "Error: Failed to upgrade the Ubuntu updates, configuration will now stop"
    exit 1
fi

# Install sendmail as this will be used to send email invites
sudo apt install sendmail -y
if [[ $? != 0 ]]
then
    echo "Error: Failed to install sendmail, configuration will now stop"
    exit 1
fi
