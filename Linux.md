# Linux

Getting a project running in the Linux enviornment is the easiest method by far. This setup process will guide you through configuring your Linux enviornment for development with E-Commerce Umbrella.

## Index

### TL;DR
If you'd rather automate the process you can download a custom script from this repository and execute it to install all libraries and setup confiurations.
```bash
curl -o- https://raw.githubusercontent.com/E-Commerce-Umbrella/Documents/main/setup-enviornment.sh?token=AAHXDSPL2GXYH2Q4JKOFWQC74Y4BI | sudo -E bash -
```

### 1) Adding repositories to APT
```
curl -sL https://deb.nodesource.com/setup_10.x | bash
```
### 2) Updating APT...
```
apt update
```

### 3) Installing packages...
```
apt install -y apache2 php libapache2-mod-php php-pear php-mysql apache2-utils mysql-server curl php-cli php-mbstring php-curl git unzip nodejs 
```

### 4) Start web services and then install phpmyadmin
```
service apache2 start
service mysql start
service redis-server start
apt install phpmyadmin
```

### 5) Composer
```
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

### 6) Laravel CLI
```
composer global require laravel/installer
```

### 7) NVM
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```

### 8) Angular CLI
We don't ever want to run NPM as a root user, so we need to point the global node_modules directory to our home. The instructions on the official NPM site show us how.
```
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

# Now we append your ~/.profile file to add npm-global to your slash commands
echo 'export PATH=~/.npm-global/bin:$PATH' | sudo tee -a ~/.profile

# To refresh...
source ~/.profile

# Install libs
npm install -g @angular/cli @ionic/cli laravel-echo-server pm2
```

### 9) Apache
Enable Apache2 mods & set permissions, create symbolic link to phpmyadmin
```
a2enmod rewrite
a2enmod ssl
a2enmod headers
service apache2 reload
usermod -aG www-data $USER
chown -R $USER:www-data /var/www
chmod -R a+w /var/www
ln -s /etc/phpmyadmin/apache.conf /etc/apache2/sites-enabled/phpmyadmin.conf
```

### 10) Canocile domain name
The project front will use a .local domain to make all API calls. Add www.shoppinchill.local to your /etc/hosts file. Ensure your DNS is already configured and your canocile domain name is working correctly. For example, http://www.yoursite.com should take you to your site.
```
echo '127.0.0.1 ecomumbrella.local www.ecomumbrella.local' | tee -a /etc/hosts
echo '127.0.0.1 shoppinchill.local www.shoppinchill.local' | tee -a /etc/hosts
echo '127.0.0.1 orderpacked.local www.orderpacked.local' | tee -a /etc/hosts
```
