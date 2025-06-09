FROM ghcr.io/biodiversity-cz/php-fpm-noroot-socket:main@sha256:93023389a0309488caf5e761e337d919a591125f4fd7cc435366962628e1e310
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
