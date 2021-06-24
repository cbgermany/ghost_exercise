# Add the NodeSource APT repository for Node 14
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash

if [[ $? != 0 ]]
then
    echo "Error: Failed to download Node.js source, configuration will now stop"
    exit 1
fi

# Install Node.js
sudo apt-get install -y nodejs

if [[ $? != 0 ]]
then
    echo "Error: Failed to install Node.js, configuration will now stop"
    exit 1
fi