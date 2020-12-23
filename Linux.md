# Linux

Getting a project running in the Linux enviornment is the easiest method by far. This setup process will guide you through configuring your Linux enviornment for development with E-Commerce Umbrella.

### TL;DR
If you'd rather automate the process you can download a custom script from this repository and execute it to install all libraries and setup confiurations.
```bash
curl -o- https://github.com/E-Commerce-Umbrella/Documents/blob/main/setup-linux-enviornment.sh | bash
```

### 1) Adding repositories to APT
```bash
curl -sL https://deb.nodesource.com/setup_10.x | bash
```
### 2) Updating APT...
```bash
sudo apt update
```

### 3) Installing packages...
```bash
sudo apt install -y apache2 php libapache2-mod-php php-pear php-mysql apache2-utils mysql-server curl php-cli php-mbstring php-curl git unzip nodejs redis-server
```

### 4) Start web services and then install phpmyadmin
```bash
sudo service apache2 start
sudo service mysql start
sudo service redis-server start
```

### 5) Composer
```bash
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

### 6) Laravel CLI
```bash
composer global require laravel/installer
```

### 7) NVM
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```

### 8) Angular CLI
We don't ever want to run NPM as a root user, so we need to point the global node_modules directory to our home. The instructions on the official NPM site show us how.
```bash
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
```bash
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod headers
sudo service apache2 reload
sudo usermod -aG www-data $USER
sudo chown -R $USER:www-data /var/www
sudo chmod -R a+w /var/www
```

### 10) Canocile domain name
The project front will use a .localhost domain to make all API calls. Add www.shoppinchill.localhost to your /etc/hosts file. Ensure your DNS is already configured and your canocile domain name is working correctly. For example, http://www.yoursite.com should take you to your site.
```bash
echo '127.0.0.1 ecomumbrella.local www.ecomumbrella.localhost' | sudo tee -a /etc/hosts
echo '127.0.0.1 shoppinchill.local www.shoppinchill.localhost' | sudo tee -a /etc/hosts
echo '127.0.0.1 orderpacked.local www.orderpacked.localhost' | sudo tee -a /etc/hosts
```

### 11) Setup MySQL root user so the phpmyadmin user can login
```
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';"
```
