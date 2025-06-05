FROM ghcr.io/biodiversity-cz/php-fpm-noroot-socket:main@sha256:fd3970a28b92f038403b3a06aca0aeea480505d4a0ca693b37b34c7bffd8fc7f
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

COPY ./www.conf /usr/local/etc/php-fpm.d/zz-docker.conf

USER www
