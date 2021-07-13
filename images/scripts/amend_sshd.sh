sudo chmod og-rwx /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication.*no/PasswordAuthentication yes/' /etc/ssh/sshd_config  # Allow password logins

if [[ $? != 0 ]]
then
    echo "Error: failed to amend sshd_config, configuration will now stop"
    exit 1
fi
