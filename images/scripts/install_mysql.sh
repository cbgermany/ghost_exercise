# Install MySQL
sudo apt-get install mysql-server -y

if [[ $? != 0 ]]
then
    echo "Error: Failed to install mysqlserver, configuration will now stop"
    exit 1
fi

# To set a password, run
sudo mysql  <<EOF

# Now update your user with this command
# Replace 'password' with your password, but keep the quote marks!
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

# Then exit MySQL
quit

EOF

if [[ $? != 0 ]]
then
    echo "Error: Failed to set mysql secure password options, configuration will now stop"
    exit 1
fi


