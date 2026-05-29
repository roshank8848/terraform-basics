#!/bin/bash
# modules/compute/install_wordpress.sh

# Exit immediately if a command exits with a non-zero status
set -e

# 1. Update system and install Apache & PHP 8.x
sudo apt-get update -y
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip mariadb-client

# 2. Restart Apache to load PHP
sudo systemctl enable apache2
sudo systemctl start apache2

# 3. Download and extract WordPress
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

# 4. Configure wp-config.php using the passed environment variables
# cd wordpress
# cp wp-config-sample.php wp-config.php

# sed -i "s/database_name_here/$DB_NAME/g" wp-config.php
# sed -i "s/username_here/$DB_USER/g" wp-config.php
# sed -i "s/password_here/$DB_PASS/g" wp-config.php
# sed -i "s/localhost/$DB_HOST/g" wp-config.php

# 5. Clean default Apache index and move WordPress files to web root
sudo rm -rf /var/www/html/index.html
sudo cp -r * /var/www/html/

# 6. Set proper permissions for Apache user
sudo chown -w /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# 7. Restart Apache one last time
sudo systemctl restart apache2
