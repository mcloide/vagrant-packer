#!/bin/bash -eux
# These were only needed for building VMware/Virtualbox extensions:
sleep 30
sudo yum install -y httpd
sudo service httpd start
sudo chkconfig httpd on

sudo yum install -y php php-mysql
sudo yum install -y php-mbstring php-mycrypt php-pdo php-bcmath php-cli php-common
sudo yum install -y php-dba php php-gd php-imap php-pecl-apc php-pecl-memcache php-soap
sudo yum install -y php-xml php-xmlrpc
sudo service httpd restart

sudo yum -y install mysql mysql-server
sudo chkconfig --levels 235 mysqld on
sudo /etc/init.d/mysqld start

sudo yum -y install expect

SECURE_MYSQL=$(expect -c "

set timeout 10
spawn mysql_secure_installation

expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"

expect \"Change the root password?\"
send \"y\r\"

expect \"New password:\"
send \"$vagrant\r\"

expect \"Re-enter new password:\"
send \"$vagrant\r\"


expect \"Remove anonymous users?\"
send \"y\r\"

expect \"Disallow root login remotely?\"
send \"y\r\"

expect \"Remove test database and access to it?\"
send \"y\r\"

expect \"Reload privilege tables now?\"
send \"y\r\"

expect eof
")

echo "$SECURE_MYSQL"

sudo service httpd restart

echo "<?php phpinfo(); ?>" > /var/www/info.php

sudo yum -y clean all
