FROM nginx:mainline-alpine
ARG GID
ARG UID
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/* && rm /etc/nginx/conf.d/default.conf
RUN echo "upstream php-upstream { server fpm:9000; }" > /etc/nginx/conf.d/upstream.conf \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && addgroup -g $GID -S lychee && adduser -u $UID -D -S -G lychee lychee
ADD nginx.conf /etc/nginx/
ADD lychee.conf /etc/nginx/conf.d/
CMD ["nginx"]
EXPOSE 80
EXPOSE 443
