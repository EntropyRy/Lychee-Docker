FROM php:8.2-fpm-alpine
ARG GID
ARG UID
RUN apk upgrade --update \
    && apk add --no-cache \
        libev \
        libjpeg \
        libpng \
        libltdl \
        gnupg \
        curl \
        exiftool \
        ffmpeg \
        jpegoptim \
        optipng \
        pngquant \
        gifsicle \
        libwebp \
        libwebp-tools \
        composer \
        imagemagick \
        icu \
        icu-data-full \
        rsync \
    && apk add --virtual build-deps \
        linux-headers \
        bash \
        grep \
        tar \
        re2c \
        make \
        file \
        git \
        oniguruma-dev \
        build-base \
        libwebp-dev \
        imagemagick-dev \
        libmcrypt-dev \
        libzip-dev \
        autoconf \
        libpng-dev \
        libxml2-dev \
        libzip-dev \
        libjpeg-turbo-dev \
        freetype-dev \
        zlib-dev \
        icu-dev \
    && addgroup -g $GID -S lychee && adduser -u $UID -D -S -G lychee lychee \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) mysqli gd intl exif bcmath pdo_mysql opcache zip sockets \
    && pecl channel-update pecl.php.net \
    && pecl install apcu imagick \
    && docker-php-ext-enable apcu imagick \
    && apk del build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

COPY ./php.ini /usr/local/etc/php/php.ini
USER lychee
WORKDIR /var/www/html/lychee
CMD ["php-fpm", "-F"]
EXPOSE 9000
