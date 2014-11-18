#!/bin/bash -eux
# These were only needed for building VMware/Virtualbox extensions:

echo '====== CREATING /etc/httpd/conf.d/vhosts.conf ======='
sudo touch /etc/httpd/conf.d/vhosts.conf
sudo chmod 777 /etc/httpd/conf.d/vhosts.conf
sudo printf '<VirtualHost *:80> \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '\n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '        ServerName %%0 \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '        ServerAlias *.%%0 \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '\n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '        UseCanonicalName Off \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '        VirtualDocumentRoot /vagrant/%%0 \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '\n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '        <Directory "/vagrant"> \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '                AllowOverride All \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '                Options +FollowSymLinks -Indexes \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '                EnableSendFile off \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '        </Directory> \n' >> /etc/httpd/conf.d/vhosts.conf
sudo printf '</VirtualHost> \n' >> /etc/httpd/conf.d/vhosts.conf

echo '====== CREATING /etc/httpd/conf.d/vhosts_ssl.conf ======='
sudo touch /etc/httpd/conf.d/vhosts_ssl.conf
sudo chmod 777 /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf 'LoadModule ssl_module modules/mod_ssl.so \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '\n \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf 'Listen 443 \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '\n \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '<VirtualHost *:443> \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        ServerName %%0 \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        ServerAlias *.%%0 \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '\n \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        UseCanonicalName Off \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        VirtualDocumentRoot /vagrant/%%0 \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '\n \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        SSLEngine On \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        SSLCertificateFile /etc/httpd/ssl/apache.crt \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        SSLCertificateKeyFile /etc/httpd/ssl/apache.key \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        SSLCipherSuite ALL:-ADH:HIGH:MEDIUM:-LOW:-SSLv2:-EXP \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '\n \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        #SetEvnIf X-Forwarded-Proto https HTTPS=1 \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        #SetEnvIf User-Agent ".*MSIE.*" nokeepalive ssl-unclean-shutdown \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '\n \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        <Directory "/vagrant"> \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '                AllowOverride All \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '                Options +FollowSymLinks -Indexes \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '                EnableSendFile off \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '        </Directory> \n' >> /etc/httpd/conf.d/vhosts_ssl.conf
sudo printf '</VirtualHost>' >> /etc/httpd/conf.d/vhosts_ssl.conf

echo '====== RESTARTING APACHE ======='
sudo service httpd restart
