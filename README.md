# Provisioning script for Vagrant (PHP 7, MySQL 2.7, Apache, Nginx)
A provisioning script for the lightweight [PHP 7 Vagrant box](https://atlas.hashicorp.com/ncaro/boxes/php7-debian8-apache-nginx-mysql/).

## Installed with
- Debian 8 (Jessie)
- PHP 7
- PHP 5.6
- PHP-FPM
- MySQL 5.7 (root/root)
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
