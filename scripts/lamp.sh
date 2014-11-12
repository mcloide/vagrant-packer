#!/bin/bash -eux
# These were only needed for building VMware/Virtualbox extensions:
sleep 30
sudo yum install -y httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo yum install mariadb-server mariadb
sudo systemctl start mariadb
echo \"& y y vagrant vagrant y y y y\" | sudo mysql_secure_installation
sudo systemctl enable mariadb.service
sudo yum install -y php php-mysql
sudo yum install -y php-mbstring php-mycrypt php-pdo php-bcmath php-cli php-common
sudo yum install -y php-dba php php-gd php-imap php-pecl-apc php-pecl-memcache php-soap
sudo yum install -y php-xml php-xmlrpc
sudo systemctl restart httpd.service
sudo yum -y clean all
