#!/bin/bash

# --------------------------------------------------
# Install Brew
# --------------------------------------------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# --------------------------------------------------
# Install packages
# --------------------------------------------------
brew install httpd php mysql node redis
brew services start httpd
brew services start mysql
brew services start redis

# --------------------------------------------------
# Install Composer
# --------------------------------------------------
curl -sS https://getcomposer.org/installer | php
php composer.phar install

# --------------------------------------------------
# Install NVM
# --------------------------------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/
install.sh | bash

# --------------------------------------------------
# Install Laravel CLI
# --------------------------------------------------
### 5) Laravel CLI
composer global require laravel/installer

# --------------------------------------------------
# Angular CLI
# We don't ever want to run NPM as a root user, so we need to point the global node_modules directory to our home. The instructions on the official NPM site show us how.
# --------------------------------------------------
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

# --------------------------------------------------
# Canocile domain name
# The project front will use a .local domain to make all API calls. Add www.shoppinchill.local to your /etc/hosts file. Ensure your DNS is already configured and your canocile domain name is working correctly. For example, http://www.yoursite.com should take you to your site.
# --------------------------------------------------
echo '127.0.0.1 ecomumbrella.local www.ecomumbrella.local' | tee -a /etc/hosts
echo '127.0.0.1 shoppinchill.local www.shoppinchill.local' | tee -a /etc/hosts
echo '127.0.0.1 orderpacked.local www.orderpacked.local' | tee -a /etc/hosts

# --------------------------------------------------
# Setup MySQL root user
# --------------------------------------------------
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';"
