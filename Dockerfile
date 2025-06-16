FROM ghcr.io/biodiversity-cz/php-fpm-noroot-socket:main@sha256:278626d05e7f59ade2b4d594caae717f50c3a12b59da02999f094ad885251753
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
