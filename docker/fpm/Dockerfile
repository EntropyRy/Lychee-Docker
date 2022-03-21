FROM php:8.1-fpm-alpine
ARG GID
ARG UID
RUN apk upgrade --update && apk add --no-cache zlib-dev icu-dev libev libmcrypt-dev libzip-dev autoconf \
    libjpeg libpng libpng-dev libltdl libxml2-dev libzip-dev libjpeg-turbo-dev freetype-dev gnupg curl \
    bash grep oniguruma-dev build-base tar re2c make file git exiftool ffmpeg jpegoptim optipng pngquant gifsicle \
    libwebp libwebp-tools composer imagemagick-dev imagemagick \
    && addgroup -g $GID -S lychee && adduser -u $UID -D -S -G lychee lychee \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install intl exif bcmath pdo_mysql opcache zip sockets mysqli \
    && pecl channel-update pecl.php.net \
    && pecl install apcu imagick \
    && docker-php-ext-enable apcu imagick \
    && apk del --no-cache grep build-base tar re2c make file git oniguruma-dev libmcrypt-dev libzip-dev \
        libpng-dev libxml2-dev libzip-dev libjpeg-turbo-dev

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
COPY ./php.ini /usr/local/etc/php/php.ini
USER lychee
WORKDIR /var/www/html/lychee
CMD ["php-fpm", "-F"]
EXPOSE 9000

