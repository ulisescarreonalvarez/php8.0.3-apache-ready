# Realhost
# © 2021 Realhost SA de CV
# @summary     Realhost
# @description Gitlab Build Docker AWS ECS Integration
# @version     1.0
# @file        Dockerfile
# @author      Ulises Carreón Alvarez
# @contact     ulises.carreon@realhost.com.mx
# @copyright   Copyright 2020-2029 Realhost SA de CV.

FROM php:8.0.3-apache

#Install the libraries that we need for run Laravel
RUN apt-get update -y && apt-get install -y \
      bash \
      git \
      unzip \
      supervisor \
      libzip-dev \
      libpng-dev  \
      supervisor  \
      libmagickwand-dev --no-install-recommends \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
      pdo_mysql \
      zip \
      gd \
    && rm -rf /tmp/* \
    && rm -rf /var/list/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN true

RUN git clone https://github.com/Imagick/imagick \
    && cd imagick \
    && phpize && ./configure \
    && make \
    && make install

RUN true

RUN docker-php-ext-enable imagick

RUN true 
#install composer, which is dependency manager for laravel
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#install composer, which is dependency manager for laravel

RUN true 
#install node for npm, which is dependency manager for laravel
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN true 
RUN bash nodesource_setup.sh
RUN true 
RUN apt-get install nodejs -y
