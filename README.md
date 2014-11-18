Vagrant Packer
==============

This repo is a variation from the repo: https://bitbucket.org/ariya/packer-vagrant-linux/src/d0359d7e64e2?at=master where it will create
a CentOS 6.5 box with:

```
    httpd service (Apache 2.2)
    mariadb service (MySQL open source version)
    php (latest available for CentOS 6.5 - should be 5.34)
```

### List of PHP Modules installed:

```
    php-mysql
    php-mbstring php-mycrypt php-pdo php-bcmath php-cli php-common
    php-dba php php-gd php-imap php-pecl-apc php-pecl-memcache php-soap
    php-xml php-xmlrpc
```

### Passwords

The file ```http/centos-6.5-x86_64-lamp/ks.cfg``` file has the password configuration set for the users on this
box. To change these passwords, change this config.

Note: the vagrant user password should not be changed. It will affect the vagrant ssh.

On the main json file the password for the ```mariadb``` (mysql) was set to be vagrant as well. It can be changed there.

### How to build the box

```
packer centos-6.5-x86_64-lamp.json
```

The process should take about 20 to 30 minutes to complete under a standard office internet
connection and under a windows computer.

