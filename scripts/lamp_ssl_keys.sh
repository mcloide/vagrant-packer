#!/bin/bash -eux

echo '====== INSTALLING MOD SSL ======'
sudo yum -y install mod_ssl

echo '====== CREATING /etc/httpd/ssl ======'
sudo mkdir /etc/httpd/ssl

echo '======= CREATING SELF SIGNED CERTIFICATE ======='

SELF_SIGNED_CERT=$(expect -c "

set timeout 10
spawn sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/httpd/ssl/apache.key -out /etc/httpd/ssl/apache.crt

expect \"Country Name (2 letter code)\"
send \"$US\r\"

expect \"State or Province Name (full name)\"
send \"$Florida\r\"

expect \"Locality Name (eg, city)\"
send \"$Coral Springs\r\"

expect \"Organization Name (eg, company)\"
send \"$none\r\"


expect \"Organizational Unit Name (eg, section)\"
send \"$none\r\"

expect \"Common Name (e.g. server FQDN or YOUR name)\"
send \"$localhost\r\"

expect \"Email Address\"
send \"$webmaster@localhost\r\"

expect eof
")

echo '======== CREATION CALL ====='

echo "$SELF_SIGNED_CERT"

echo '======= RESTARTING APACHE ====='

sudo service httpd restart
