# Install NGINX
sudo apt-get install nginx -y

if [[ $? != 0 ]]
then
    echo "Error: Failed to install Nginx, configuration will now stop"
    exit 1
fi

# Open the firewall for Nginx
sudo ufw allow 'Nginx Full'

if [[ $? != 0 ]]
then
    echo "Error: Failed to activate filewall for Nginx, configuration will now stop"
    exit 1
fi
