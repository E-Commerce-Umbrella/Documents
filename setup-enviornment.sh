#bin/bash

# Create the log file
touch setup-enviornment.log

# Clear the log file
> setup-enviornment.log

# Clear console for pretty output
clear

echo "Adding repositories to APT"
curl -sL https://deb.nodesource.com/setup_10.x | bash | tee setup-enviornment.log

echo "Updating APT..."
apt update | tee setup-enviornment.log

echo "Installing packages..."
apt install -y apache2 php libapache2-mod-php php-pear php-mysql apache2-utils mysql-server curl php-cli php-mbstring php-curl git unzip | tee setup-enviornment.log
