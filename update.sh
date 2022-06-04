#!/bin/bash
dc='docker compose'

touch ./Lychee/.NO_AUTO_COMPOSER_MIGRATE;
$dc build --pull;
$dc up -d;
cd Lychee;
git pull;
cd ..;
$dc exec fpm /usr/bin/composer.phar install -o --no-dev --prefer-dist;
$dc exec fpm ./artisan migrate --force
