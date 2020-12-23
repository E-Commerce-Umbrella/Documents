# MacOS

Without question the most difficult to get set up. 

### TL;DR
Use the following script to automate the install and setup process, or follow each section below
```
curl -o- "https://raw.githubusercontent.com/E-Commerce-Umbrella/Documents/main/setup-macos-enviornment.sh" | bash
```


### 1) Install Brew.
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2) Install packages
```bash
brew install httpd php mysql node redis
brew services start httpd
brew services start mysql
brew services start redis
```

### 3) Install Composer
```
curl -sS https://getcomposer.org/installer | php
php composer.phar install
```

### 4) Install NVM
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```

### 5) Laravel CLI
```
composer global require laravel/installer
```

### 6) Angular CLI
We don't ever want to run NPM as a root user, so we need to point the global node_modules directory to our home. The instructions on the official NPM site show us how.
```
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
```

### 7) Canocile domain name
The project front will use a .local domain to make all API calls. Add www.shoppinchill.local to your /etc/hosts file. Ensure your DNS is already configured and your canocile domain name is working correctly. For example, http://www.yoursite.com should take you to your site.
```
echo '127.0.0.1 ecomumbrella.local www.ecomumbrella.local' | sudo tee -a /etc/hosts
echo '127.0.0.1 shoppinchill.local www.shoppinchill.local' | sudo tee -a /etc/hosts
echo '127.0.0.1 orderpacked.local www.orderpacked.local' | sudo tee -a /etc/hosts
```

### 8) Setup MySQL root user 
```
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';"
```
