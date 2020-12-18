#bin/bash

# Name the log file
LOG_FILE=setup-enviornment.log

# Create the log file
touch ${LOG_FILE}

# Clear the log file
> ${LOG_FILE}

# Clear console for pretty output
clear

echo "Adding repositories to APT"
curl -sL https://deb.nodesource.com/setup_10.x 3>&1 1>>${LOG_FILE} 2>&1 | bash

echo "Updating APT..."
apt update 3>&1 1>>${LOG_FILE} 2>&1

echo "Installing packages..."
apt install -y apache2 php libapache2-mod-php php-pear php-mysql apache2-utils mysql-server curl php-cli php-mbstring php-curl git unzip | 3>&1 1>>${LOG_FILE} 2>&1
