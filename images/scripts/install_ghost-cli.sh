sudo npm install ghost-cli@latest -g -y

if [[ $? != 0 ]]
then
    echo "Error: Failed to install ghost-cli, configuration will now stop"
    exit 1
fi

