#bin/bash

# ------------------------------------------------------
# Adding repositories to APT
# ------------------------------------------------------
curl -sL https://deb.nodesource.com/setup_10.x | bash

# ------------------------------------------------------
# Updating APT...
# ------------------------------------------------------
apt update

# ------------------------------------------------------
# Installing packages...
# ------------------------------------------------------
apt install -y apache2 php libapache2-mod-php php-pear php-mysql apache2-utils mysql-server curl php-cli php-mbstring php-curl git unzip nodejs 

# ------------------------------------------------------
# Start web services
# ------------------------------------------------------
service apache2 start
service mysql start
service redis-server start

# ------------------------------------------------------
# Composer
# ------------------------------------------------------
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# ------------------------------------------------------
# Laravel CLI
# ------------------------------------------------------
composer global require laravel/installer

# ------------------------------------------------------
# NVM
# ------------------------------------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# ------------------------------------------------------
# Angular CLI
# We don't ever want to run NPM as a root user, so we need to point the global node_modules directory to our home. The instructions on the official NPM site show us how.
# ------------------------------------------------------
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

# Disable the "Would you like to share anonymous usage data with the Angular Team..." message
export NG_CLI_ANALYTICS="false"

# Now we append your ~/.profile file to add npm-global to your slash commands
echo 'export PATH=~/.npm-global/bin:$PATH' | tee -a ~/.profile

# To refresh...
source ~/.profile

# Install libs
npm install -g @angular/cli @ionic/cli laravel-echo-server pm2 > /dev/null

# ------------------------------------------------------
# Apache
# Enable Apache2 mods & set permissions
# ------------------------------------------------------
a2enmod rewrite
a2enmod ssl
a2enmod headers
service apache2 restart
usermod -aG www-data $USER
chown -R $USER:www-data /var/www
chmod -R a+w /var/www

# ------------------------------------------------------
# Canocile domain name
# The project front will use a .local domain to make all API calls. Add www.shoppinchill.local to your /etc/hosts file. Ensure your DNS is already configured and your canocile domain name is working correctly. For example, http://www.yoursite.com should take you to your site.
# ------------------------------------------------------
echo '127.0.0.1 ecomumbrella.local www.ecomumbrella.local' | tee -a /etc/hosts
echo '127.0.0.1 shoppinchill.local www.shoppinchill.local' | tee -a /etc/hosts
echo '127.0.0.1 orderpacked.local www.orderpacked.local' | tee -a /etc/hosts

# ------------------------------------------------------
# Setup MySQL root user so the phpmyadmin user can login
# ------------------------------------------------------
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';"

# ------------------------------------------------------
# Install phpmyadmin, create symbolic link to phpmyadmin
# ------------------------------------------------------
apt install phpmyadmin -y
ln -s /etc/phpmyadmin/apache.conf /etc/apache2/sites-enabled/phpmyadmin.conf
service apache2 restart
