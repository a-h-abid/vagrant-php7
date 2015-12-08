# Vagrant PHP 7 Box
A setup and provisioning script for the lightweight [PHP 7 Vagrant box](https://atlas.hashicorp.com/ncaro/boxes/php7-debian8-apache-nginx-mysql/). Run your PHP applications in an extremely performant Vagrant Debian/PHP 7 environment.

## Installed with
- Debian 8 (Jessie)
- PHP 7
- PHP 5.6
- PHP-FPM
- MySQL 5.7
- Apache
- Nginx
- Memcached
- Redis
- Node.js
- NPM
- Grunt
- Gulp
- Bower
- Composer

## How to use
Map the folders you'd like to sync with Vagrant in the `config.yaml` file. By default, if you place this in the root of your project, it will use that folder. Choose your PHP version and preferred server (defaults to PHP 7 and nginx).

Run `vagrant up`. That's all.

## MySQL
You can access the MySQL instance through SSH, credentials as follows:

```
MySQL Host: 127.0.0.1
Username: root
Password: root
Port: 3306

SSH IP: {your-ip}
SSH User: vagrant
SSH Password: vagrant
SSH Key: ~/.vagrant.d/insecure_private_key (this may be different depending on your environment)
SSH Port: 2222
```
