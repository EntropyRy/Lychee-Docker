# Docker-compose for Lychee 

PHP 8.1, MariaDB 10.5 and Nginx 1.19, Easy setup with docker-compose.

I'm going to use this behind reverse proxy to get SSL support and don't know yet if some config for that is still needed.

# Setup

1. `git clone https://github.com/EntropyRy/Lychee-Docker` // clone this repo
2. `cd Lychee-Docker` // go in the dir
3. `git clone git@github.com:LycheeOrg/Lychee.git` // clone the actual sofware
4. `cp .env.example .env` and change settings
5. Change settings in `docker/fpm/php.ini` // Not sure if you even needed to change anything
6. `cp Lychee/.env.example Lychee/.env` and change settings same as in `.env` // These are your actual Lychee settings
    1. `DB_CONNECTION` is `mysql`, `DB_HOST` is `db` and port `3306`
    2. You can change `CACHE_DRIVER` and `SESSION_DRIVER` as `apc`
7. run `docker-compose build; docker-compose up -d` // build and start the docker containers
8. visit http://localhost // to see if everything is working
9. run `docker-compose exec fpm php -d memory_limit=-1 /usr/bin/composer.phar install` // to install depencies
10. finalize the setup in http://localhost

# DB backup and import

backup

1. `cp .env docker/`
2. `./docker/db-backup.sh`

import

1. `gzip -d /docker/backup/file.sql.gz`
2. `./docker/db-import.sh /docker/backup/file.sql`
3. `docker-compose restart db`

# Running artisan

1. `docker-compose exec fpm ./artisan`

# Upgrade

Coming soon but should be same as upgrade in Lychee docs: git pull, compsoser install
