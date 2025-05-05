FROM ghcr.io/biodiversity-cz/php-fpm-noroot-socket:main@sha256:15b7960fbb6dc0572cf5a53d0d9dde3364b5453616f1b1f14454cbe5339a5a81
USER root

RUN  apt-get update && apt-get dist-upgrade -y && \
        apt-get install -y --no-install-recommends \
        libicu-dev \
        libpng-dev  && \
        apt-get autoclean -y && \
        apt-get remove -y wget && \
        apt-get autoremove -y && \
        rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

RUN  docker-php-ext-install intl opcache pdo pdo_mysql \
     && docker-php-ext-enable opcache \
     && docker-php-ext-install gd


USER www
