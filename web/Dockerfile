# Use intermediate container to install dependencies
FROM php:7.3-alpine AS builder
ARG COMPOSER_VERSION="1.8.5"

WORKDIR /app

RUN apk update \
 && apk add git unzip \
 && curl https://getcomposer.org/download/$COMPOSER_VERSION/composer.phar --output /usr/bin/composer \
 && chmod u+x /usr/bin/composer

COPY ./composer.json composer.json
COPY ./composer.lock composer.lock

RUN composer install --no-scripts --no-autoloader

COPY . .

RUN composer dump-autoload --optimize

# Copy dependencies into the final PHP FPM container
FROM php:7.3-fpm-alpine
RUN apk add ssmtp && \
    docker-php-ext-install mysqli && docker-php-ext-enable mysqli

COPY --from=builder /app /var/www

# modify ssmtp settings
RUN sed -ri -e 's/^(mailhub=).*/\1smtp-server/' \
    -e 's/^#(FromLineOverride)/\1/' /etc/ssmtp/ssmtp.conf
	
# set twig cache permissions
RUN mkdir -p /var/www/tmp && \
    chown www-data:www-data /var/www/tmp
